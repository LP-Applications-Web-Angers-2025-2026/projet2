float =v1-v2;
float =v2-v3;
cout<<setprecision(10);
cout<<"v1-v2 = "<<diff_v1_v2<<endl;
cout<<"v2-v3 = "<<diff_v2_v3<<endl;
float =fabs(v3-v4);
cout<<"|v3-v4| = "<<diff_v3_v4<<endl;
if(diff_v3_v4<1E-6)
cout<<"v3 = v4"<<endl;
else
cout<<"v3 != v4"<<endl;
return ;
28}