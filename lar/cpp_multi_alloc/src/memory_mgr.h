#ifndef MEMORY_MANAGER_H
#define MEMORY_MANAGER_H

#include <stdio.h>
#include <sys/types.h>
#include <iostream>
#include <vector>
#include <iterator>

using namespace std;

/**
 * Interface for Memory Manager
 *
 */
template<class T>
class IMemoryManager {
 public:

  /**
   * allocate a new object 
   */
  virtual void *allocate(size_t n)=0;

  /**
   * free an object
   */
  virtual void free(void *p)=0;

  /**
   * allocate an array of objects
   */
  virtual void *allocate_array(size_t n)=0;

  /**
   * free an array of objects
   */
  virtual void free_array(void *p)=0;

  /**
   * return size of one object, this function can be used
   * to make the size of an object fit a particular size
   */
  virtual size_t adjust_size()=0;
};


/**
 * a BlockMemoryManager is a Memory Manager that 
 * - allocates objects by groups
 * - frees objects by putting them in a list of
 *   available objects
 * the purpose of this manager is to decrease the time
 * spent allocating and freeing objects when we need to
 * do it zillion of times
 */
template<class T>
class BlockMemoryManager : public IMemoryManager<T> {
 private:

  /**
   * structure used to link free objects in a linked list
   */
  struct FreeStore {
    FreeStore *next;
  };

  /**
   * vector of addresses of allocated blocks
   *
   */
  vector<void *> allocated;

  /**
   * pointer to first free object
   */
  FreeStore *freeStorePtr;

  /**
   * number of objects to allocate if no more objects
   * are available
   */
  size_t row_size;

  /**
   * number of allocated objects
   */
  size_t count_objects;


 public:

  /**
   * constructor
   * @param rs number of objects to allocate in a row
   */
  BlockMemoryManager(size_t rs=32) {
    freeStorePtr=NULL;
    if (!rs) rs=32;
    row_size=rs;
    count_objects=0;
  }

  /**
   * destructor, removes all allocated blocks
   *
   */
  virtual ~BlockMemoryManager() {
    clean_up();
  }

  /**
   * allocate a new object
   * @param n size of the object (in bytes)
   */
  virtual void *allocate(size_t n) {
    // if no more objects are available, then create
    // a new row of objects
    if (freeStorePtr==NULL) allocate_new_block();

    // return first available object and remove it from list
    // of available objects
    FreeStore *ptr=freeStorePtr;
    freeStorePtr=ptr->next;
    return ptr;
  }

  /**
   * free one object
   * @param p pointer to object
   */
  virtual void free(void *p) {
    // put object at the beginning of the linked list 
    // of available objects
    FreeStore *ptr=static_cast<FreeStore *>(p);
    ptr->next=freeStorePtr;
    freeStorePtr=ptr;
  }

  /**
   * allocate array of objects
   * @param n size of the array (=number of elements * sizeof(one element))
   * note : that the objects allocated as arrays are not put into the
   * linked list of available objects when freed
   */
  virtual void *allocate_array(size_t n) {
    return calloc(n,sizeof(T));
  }

  /**
   * free an array of objects
   * @param p pointer to beginning of array
   * note : that the objects allocated as arrays are not put into the
   * linked list of available objects when freed
   */
  virtual void free_array(void *p) {
    free(p);
  }

  /**
   * return size of one element
   * note : a BlockMemoryManager doesn't adjust the size of the element
   */
  virtual size_t adjust_size() {
    return sizeof(T);
  }

  /**
   * display information
   *
   */
  void info() {
    cout << "Memory Manager Information :" << endl;
    cout << "----------------------------" << endl;
    cout << "number of blocks allocated = " << allocated.size() << endl;
    cout << "size of one element = " << adjust_size() << endl;
    cout << "number of elements in a block = " << row_size << endl;
    size_t total=row_size * adjust_size() * allocated.size();
    cout << "total size of memory = " << total << endl;
    vector<void *>::iterator iter;
    cout << hex;
    for (iter=allocated.begin();iter!=allocated.end();++iter) {
      cout << *iter << endl;
    }
    cout << dec;
  }

  /**
   * return number of objects allocated
   */
  size_t get_count_objects() {
    return count_objects;
  }


 private:

  /**
   * allocate a new block of objects and add them to the
   * list of available objects
   */
  void allocate_new_block() {
    size_t size=adjust_size();

    FreeStore *array=reinterpret_cast<FreeStore *>(new char[row_size*size]);
    allocated.push_back(reinterpret_cast<void *>(array));
    freeStorePtr=array;

    char *ptr=reinterpret_cast<char *>(array);

    for (size_t i=0;i<row_size-1;++i) {
      ((FreeStore *)ptr)->next=(FreeStore *)(ptr+size);
      ptr+=size;
    }
    ((FreeStore *)ptr)->next=NULL;

    count_objects += row_size;

  }


  void clean_up() { 
    vector<void *>::iterator iter;
    for (iter=allocated.begin();iter!=allocated.end();++iter) {
      delete [] reinterpret_cast<char *>(*iter);
    }
  }

};


/**
 * BlockMemoryManager for which the size of an object is
 * specified by the user
 *
 */
template<class T>
class SizeBlockMemoryManager : public BlockMemoryManager<T> {
 public:

  /**
   * constructor
   * @param s size of one object
   * @param rs number of objects allocated in a row
   */
  SizeBlockMemoryManager(size_t s, size_t rs=32) : BlockMemoryManager<T>(rs) {
    wanted_size=s;
  }

  /**
   * destructor
   */
  virtual ~SizeBlockMemoryManager() {
  }

  /**
   * return size of one object
   */
  size_t adjust_size() {
    return wanted_size;
  }

 private:

  /**
   * size of one object as specified by the user
   */
  size_t wanted_size;
  
};


#endif

