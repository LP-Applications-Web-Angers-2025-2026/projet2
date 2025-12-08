
build/bin/asm_saxpy_32.exe:     format de fichier elf32-i386


Déassemblage de la section .init :

00002000 <_init>:
    2000:	53                   	push   %ebx
    2001:	83 ec 08             	sub    $0x8,%esp
    2004:	e8 27 18 00 00       	call   3830 <__x86.get_pc_thunk.bx>
    2009:	81 c3 b3 ce 00 00    	add    $0xceb3,%ebx
    200f:	8b 83 34 01 00 00    	mov    0x134(%ebx),%eax
    2015:	85 c0                	test   %eax,%eax
    2017:	74 02                	je     201b <_init+0x1b>
    2019:	ff d0                	call   *%eax
    201b:	83 c4 08             	add    $0x8,%esp
    201e:	5b                   	pop    %ebx
    201f:	c3                   	ret

Déassemblage de la section .plt :

00002020 <__printf_chk@plt-0x10>:
    2020:	ff b3 04 00 00 00    	push   0x4(%ebx)
    2026:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
    202c:	00 00                	add    %al,(%eax)
	...

00002030 <__printf_chk@plt>:
    2030:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
    2036:	68 00 00 00 00       	push   $0x0
    203b:	e9 e0 ff ff ff       	jmp    2020 <_init+0x20>

00002040 <_ZNSo3putEc@plt>:
    2040:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
    2046:	68 08 00 00 00       	push   $0x8
    204b:	e9 d0 ff ff ff       	jmp    2020 <_init+0x20>

00002050 <_Znwj@plt>:
    2050:	ff a3 14 00 00 00    	jmp    *0x14(%ebx)
    2056:	68 10 00 00 00       	push   $0x10
    205b:	e9 c0 ff ff ff       	jmp    2020 <_init+0x20>

00002060 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE7_M_syncEPcjj@plt>:
    2060:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
    2066:	68 18 00 00 00       	push   $0x18
    206b:	e9 b0 ff ff ff       	jmp    2020 <_init+0x20>

00002070 <_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@plt>:
    2070:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
    2076:	68 20 00 00 00       	push   $0x20
    207b:	e9 a0 ff ff ff       	jmp    2020 <_init+0x20>

00002080 <sigaction@plt>:
    2080:	ff a3 20 00 00 00    	jmp    *0x20(%ebx)
    2086:	68 28 00 00 00       	push   $0x28
    208b:	e9 90 ff ff ff       	jmp    2020 <_init+0x20>

00002090 <_ZNSt8ios_baseC2Ev@plt>:
    2090:	ff a3 24 00 00 00    	jmp    *0x24(%ebx)
    2096:	68 30 00 00 00       	push   $0x30
    209b:	e9 80 ff ff ff       	jmp    2020 <_init+0x20>

000020a0 <_ZNSt8ios_baseD2Ev@plt>:
    20a0:	ff a3 28 00 00 00    	jmp    *0x28(%ebx)
    20a6:	68 38 00 00 00       	push   $0x38
    20ab:	e9 70 ff ff ff       	jmp    2020 <_init+0x20>

000020b0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEjj@plt>:
    20b0:	ff a3 2c 00 00 00    	jmp    *0x2c(%ebx)
    20b6:	68 40 00 00 00       	push   $0x40
    20bb:	e9 60 ff ff ff       	jmp    2020 <_init+0x20>

000020c0 <getopt_long@plt>:
    20c0:	ff a3 30 00 00 00    	jmp    *0x30(%ebx)
    20c6:	68 48 00 00 00       	push   $0x48
    20cb:	e9 50 ff ff ff       	jmp    2020 <_init+0x20>

000020d0 <_ZNSo9_M_insertIxEERSoT_@plt>:
    20d0:	ff a3 34 00 00 00    	jmp    *0x34(%ebx)
    20d6:	68 50 00 00 00       	push   $0x50
    20db:	e9 40 ff ff ff       	jmp    2020 <_init+0x20>

000020e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEjjPKcj@plt>:
    20e0:	ff a3 38 00 00 00    	jmp    *0x38(%ebx)
    20e6:	68 58 00 00 00       	push   $0x58
    20eb:	e9 30 ff ff ff       	jmp    2020 <_init+0x20>

000020f0 <__cxa_begin_catch@plt>:
    20f0:	ff a3 3c 00 00 00    	jmp    *0x3c(%ebx)
    20f6:	68 60 00 00 00       	push   $0x60
    20fb:	e9 20 ff ff ff       	jmp    2020 <_init+0x20>

00002100 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>:
    2100:	ff a3 40 00 00 00    	jmp    *0x40(%ebx)
    2106:	68 68 00 00 00       	push   $0x68
    210b:	e9 10 ff ff ff       	jmp    2020 <_init+0x20>

00002110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
    2110:	ff a3 44 00 00 00    	jmp    *0x44(%ebx)
    2116:	68 70 00 00 00       	push   $0x70
    211b:	e9 00 ff ff ff       	jmp    2020 <_init+0x20>

00002120 <__cxa_allocate_exception@plt>:
    2120:	ff a3 48 00 00 00    	jmp    *0x48(%ebx)
    2126:	68 78 00 00 00       	push   $0x78
    212b:	e9 f0 fe ff ff       	jmp    2020 <_init+0x20>

00002130 <memcpy@plt>:
    2130:	ff a3 4c 00 00 00    	jmp    *0x4c(%ebx)
    2136:	68 80 00 00 00       	push   $0x80
    213b:	e9 e0 fe ff ff       	jmp    2020 <_init+0x20>

00002140 <_ZSt20__throw_length_errorPKc@plt>:
    2140:	ff a3 50 00 00 00    	jmp    *0x50(%ebx)
    2146:	68 88 00 00 00       	push   $0x88
    214b:	e9 d0 fe ff ff       	jmp    2020 <_init+0x20>

00002150 <strlen@plt>:
    2150:	ff a3 54 00 00 00    	jmp    *0x54(%ebx)
    2156:	68 90 00 00 00       	push   $0x90
    215b:	e9 c0 fe ff ff       	jmp    2020 <_init+0x20>

00002160 <_ZSt24__throw_invalid_argumentPKc@plt>:
    2160:	ff a3 58 00 00 00    	jmp    *0x58(%ebx)
    2166:	68 98 00 00 00       	push   $0x98
    216b:	e9 b0 fe ff ff       	jmp    2020 <_init+0x20>

00002170 <_ZNSo9_M_insertIyEERSoT_@plt>:
    2170:	ff a3 5c 00 00 00    	jmp    *0x5c(%ebx)
    2176:	68 a0 00 00 00       	push   $0xa0
    217b:	e9 a0 fe ff ff       	jmp    2020 <_init+0x20>

00002180 <_ZNSo9_M_insertImEERSoT_@plt>:
    2180:	ff a3 60 00 00 00    	jmp    *0x60(%ebx)
    2186:	68 a8 00 00 00       	push   $0xa8
    218b:	e9 90 fe ff ff       	jmp    2020 <_init+0x20>

00002190 <_ZNSo5flushEv@plt>:
    2190:	ff a3 64 00 00 00    	jmp    *0x64(%ebx)
    2196:	68 b0 00 00 00       	push   $0xb0
    219b:	e9 80 fe ff ff       	jmp    2020 <_init+0x20>

000021a0 <__cxa_atexit@plt>:
    21a0:	ff a3 68 00 00 00    	jmp    *0x68(%ebx)
    21a6:	68 b8 00 00 00       	push   $0xb8
    21ab:	e9 70 fe ff ff       	jmp    2020 <_init+0x20>

000021b0 <_ZSt19__throw_logic_errorPKc@plt>:
    21b0:	ff a3 6c 00 00 00    	jmp    *0x6c(%ebx)
    21b6:	68 c0 00 00 00       	push   $0xc0
    21bb:	e9 60 fe ff ff       	jmp    2020 <_init+0x20>

000021c0 <__cxa_free_exception@plt>:
    21c0:	ff a3 70 00 00 00    	jmp    *0x70(%ebx)
    21c6:	68 c8 00 00 00       	push   $0xc8
    21cb:	e9 50 fe ff ff       	jmp    2020 <_init+0x20>

000021d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofEPKcjj@plt>:
    21d0:	ff a3 74 00 00 00    	jmp    *0x74(%ebx)
    21d6:	68 d0 00 00 00       	push   $0xd0
    21db:	e9 40 fe ff ff       	jmp    2020 <_init+0x20>

000021e0 <__libc_start_main@plt>:
    21e0:	ff a3 78 00 00 00    	jmp    *0x78(%ebx)
    21e6:	68 d8 00 00 00       	push   $0xd8
    21eb:	e9 30 fe ff ff       	jmp    2020 <_init+0x20>

000021f0 <posix_memalign@plt>:
    21f0:	ff a3 7c 00 00 00    	jmp    *0x7c(%ebx)
    21f6:	68 e0 00 00 00       	push   $0xe0
    21fb:	e9 20 fe ff ff       	jmp    2020 <_init+0x20>

00002200 <_ZNSo9_M_insertIPKvEERSoT_@plt>:
    2200:	ff a3 80 00 00 00    	jmp    *0x80(%ebx)
    2206:	68 e8 00 00 00       	push   $0xe8
    220b:	e9 10 fe ff ff       	jmp    2020 <_init+0x20>

00002210 <__errno_location@plt>:
    2210:	ff a3 84 00 00 00    	jmp    *0x84(%ebx)
    2216:	68 f0 00 00 00       	push   $0xf0
    221b:	e9 00 fe ff ff       	jmp    2020 <_init+0x20>

00002220 <memcmp@plt>:
    2220:	ff a3 88 00 00 00    	jmp    *0x88(%ebx)
    2226:	68 f8 00 00 00       	push   $0xf8
    222b:	e9 f0 fd ff ff       	jmp    2020 <_init+0x20>

00002230 <sigemptyset@plt>:
    2230:	ff a3 8c 00 00 00    	jmp    *0x8c(%ebx)
    2236:	68 00 01 00 00       	push   $0x100
    223b:	e9 e0 fd ff ff       	jmp    2020 <_init+0x20>

00002240 <_ZNSolsEs@plt>:
    2240:	ff a3 90 00 00 00    	jmp    *0x90(%ebx)
    2246:	68 08 01 00 00       	push   $0x108
    224b:	e9 d0 fd ff ff       	jmp    2020 <_init+0x20>

00002250 <_ZdlPv@plt>:
    2250:	ff a3 94 00 00 00    	jmp    *0x94(%ebx)
    2256:	68 10 01 00 00       	push   $0x110
    225b:	e9 c0 fd ff ff       	jmp    2020 <_init+0x20>

00002260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    2260:	ff a3 98 00 00 00    	jmp    *0x98(%ebx)
    2266:	68 18 01 00 00       	push   $0x118
    226b:	e9 b0 fd ff ff       	jmp    2020 <_init+0x20>

00002270 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEjc@plt>:
    2270:	ff a3 9c 00 00 00    	jmp    *0x9c(%ebx)
    2276:	68 20 01 00 00       	push   $0x120
    227b:	e9 a0 fd ff ff       	jmp    2020 <_init+0x20>

00002280 <_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@plt>:
    2280:	ff a3 a0 00 00 00    	jmp    *0xa0(%ebx)
    2286:	68 28 01 00 00       	push   $0x128
    228b:	e9 90 fd ff ff       	jmp    2020 <_init+0x20>

00002290 <__stack_chk_fail@plt>:
    2290:	ff a3 a4 00 00 00    	jmp    *0xa4(%ebx)
    2296:	68 30 01 00 00       	push   $0x130
    229b:	e9 80 fd ff ff       	jmp    2020 <_init+0x20>

000022a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>:
    22a0:	ff a3 a8 00 00 00    	jmp    *0xa8(%ebx)
    22a6:	68 38 01 00 00       	push   $0x138
    22ab:	e9 70 fd ff ff       	jmp    2020 <_init+0x20>

000022b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>:
    22b0:	ff a3 ac 00 00 00    	jmp    *0xac(%ebx)
    22b6:	68 40 01 00 00       	push   $0x140
    22bb:	e9 60 fd ff ff       	jmp    2020 <_init+0x20>

000022c0 <free@plt>:
    22c0:	ff a3 b0 00 00 00    	jmp    *0xb0(%ebx)
    22c6:	68 48 01 00 00       	push   $0x148
    22cb:	e9 50 fd ff ff       	jmp    2020 <_init+0x20>

000022d0 <_ZSt16__throw_bad_castv@plt>:
    22d0:	ff a3 b4 00 00 00    	jmp    *0xb4(%ebx)
    22d6:	68 50 01 00 00       	push   $0x150
    22db:	e9 40 fd ff ff       	jmp    2020 <_init+0x20>

000022e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>:
    22e0:	ff a3 b8 00 00 00    	jmp    *0xb8(%ebx)
    22e6:	68 58 01 00 00       	push   $0x158
    22eb:	e9 30 fd ff ff       	jmp    2020 <_init+0x20>

000022f0 <_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@plt>:
    22f0:	ff a3 bc 00 00 00    	jmp    *0xbc(%ebx)
    22f6:	68 60 01 00 00       	push   $0x160
    22fb:	e9 20 fd ff ff       	jmp    2020 <_init+0x20>

00002300 <feenableexcept@plt>:
    2300:	ff a3 c0 00 00 00    	jmp    *0xc0(%ebx)
    2306:	68 68 01 00 00       	push   $0x168
    230b:	e9 10 fd ff ff       	jmp    2020 <_init+0x20>

00002310 <_ZNSt6localeD1Ev@plt>:
    2310:	ff a3 c4 00 00 00    	jmp    *0xc4(%ebx)
    2316:	68 70 01 00 00       	push   $0x170
    231b:	e9 00 fd ff ff       	jmp    2020 <_init+0x20>

00002320 <_ZNSt11logic_errorC1EPKc@plt>:
    2320:	ff a3 c8 00 00 00    	jmp    *0xc8(%ebx)
    2326:	68 78 01 00 00       	push   $0x178
    232b:	e9 f0 fc ff ff       	jmp    2020 <_init+0x20>

00002330 <exit@plt>:
    2330:	ff a3 cc 00 00 00    	jmp    *0xcc(%ebx)
    2336:	68 80 01 00 00       	push   $0x180
    233b:	e9 e0 fc ff ff       	jmp    2020 <_init+0x20>

00002340 <_ZSt20__throw_out_of_rangePKc@plt>:
    2340:	ff a3 d0 00 00 00    	jmp    *0xd0(%ebx)
    2346:	68 88 01 00 00       	push   $0x188
    234b:	e9 d0 fc ff ff       	jmp    2020 <_init+0x20>

00002350 <__cxa_rethrow@plt>:
    2350:	ff a3 d4 00 00 00    	jmp    *0xd4(%ebx)
    2356:	68 90 01 00 00       	push   $0x190
    235b:	e9 c0 fc ff ff       	jmp    2020 <_init+0x20>

00002360 <_ZNSo9_M_insertIdEERSoT_@plt>:
    2360:	ff a3 d8 00 00 00    	jmp    *0xd8(%ebx)
    2366:	68 98 01 00 00       	push   $0x198
    236b:	e9 b0 fc ff ff       	jmp    2020 <_init+0x20>

00002370 <__cxa_end_catch@plt>:
    2370:	ff a3 dc 00 00 00    	jmp    *0xdc(%ebx)
    2376:	68 a0 01 00 00       	push   $0x1a0
    237b:	e9 a0 fc ff ff       	jmp    2020 <_init+0x20>

00002380 <err@plt>:
    2380:	ff a3 e0 00 00 00    	jmp    *0xe0(%ebx)
    2386:	68 a8 01 00 00       	push   $0x1a8
    238b:	e9 90 fc ff ff       	jmp    2020 <_init+0x20>

00002390 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>:
    2390:	ff a3 e4 00 00 00    	jmp    *0xe4(%ebx)
    2396:	68 b0 01 00 00       	push   $0x1b0
    239b:	e9 80 fc ff ff       	jmp    2020 <_init+0x20>

000023a0 <__cxa_throw@plt>:
    23a0:	ff a3 e8 00 00 00    	jmp    *0xe8(%ebx)
    23a6:	68 b8 01 00 00       	push   $0x1b8
    23ab:	e9 70 fc ff ff       	jmp    2020 <_init+0x20>

000023b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>:
    23b0:	ff a3 ec 00 00 00    	jmp    *0xec(%ebx)
    23b6:	68 c0 01 00 00       	push   $0x1c0
    23bb:	e9 60 fc ff ff       	jmp    2020 <_init+0x20>

000023c0 <_ZNSolsEi@plt>:
    23c0:	ff a3 f0 00 00 00    	jmp    *0xf0(%ebx)
    23c6:	68 c8 01 00 00       	push   $0x1c8
    23cb:	e9 50 fc ff ff       	jmp    2020 <_init+0x20>

000023d0 <_Unwind_Resume@plt>:
    23d0:	ff a3 f4 00 00 00    	jmp    *0xf4(%ebx)
    23d6:	68 d0 01 00 00       	push   $0x1d0
    23db:	e9 40 fc ff ff       	jmp    2020 <_init+0x20>

000023e0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>:
    23e0:	ff a3 f8 00 00 00    	jmp    *0xf8(%ebx)
    23e6:	68 d8 01 00 00       	push   $0x1d8
    23eb:	e9 30 fc ff ff       	jmp    2020 <_init+0x20>

000023f0 <__isoc23_strtol@plt>:
    23f0:	ff a3 fc 00 00 00    	jmp    *0xfc(%ebx)
    23f6:	68 e0 01 00 00       	push   $0x1e0
    23fb:	e9 20 fc ff ff       	jmp    2020 <_init+0x20>

00002400 <_ZNSt6localeC1Ev@plt>:
    2400:	ff a3 00 01 00 00    	jmp    *0x100(%ebx)
    2406:	68 e8 01 00 00       	push   $0x1e8
    240b:	e9 10 fc ff ff       	jmp    2020 <_init+0x20>

Déassemblage de la section .plt.got :

00002410 <__cxa_finalize@plt>:
    2410:	ff a3 04 01 00 00    	jmp    *0x104(%ebx)
    2416:	66 90                	xchg   %ax,%ax

Déassemblage de la section .text :

00002420 <_ZN8CPUTimer5printERSo.cold>:
    2420:	83 ec 0c             	sub    $0xc,%esp
    2423:	89 fb                	mov    %edi,%ebx
    2425:	6a 08                	push   $0x8
    2427:	e8 f4 fc ff ff       	call   2120 <__cxa_allocate_exception@plt>
    242c:	59                   	pop    %ecx
    242d:	89 c6                	mov    %eax,%esi
    242f:	58                   	pop    %eax
    2430:	8d 87 4c c1 ff ff    	lea    -0x3eb4(%edi),%eax
    2436:	50                   	push   %eax
    2437:	56                   	push   %esi
    2438:	e8 e3 fe ff ff       	call   2320 <_ZNSt11logic_errorC1EPKc@plt>
    243d:	83 c4 0c             	add    $0xc,%esp
    2440:	ff b7 20 01 00 00    	push   0x120(%edi)
    2446:	ff b7 30 01 00 00    	push   0x130(%edi)
    244c:	56                   	push   %esi
    244d:	e8 4e ff ff ff       	call   23a0 <__cxa_throw@plt>
    2452:	83 ec 0c             	sub    $0xc,%esp
    2455:	89 fb                	mov    %edi,%ebx
    2457:	6a 08                	push   $0x8
    2459:	e8 c2 fc ff ff       	call   2120 <__cxa_allocate_exception@plt>
    245e:	8d 8f 66 c1 ff ff    	lea    -0x3e9a(%edi),%ecx
    2464:	89 c6                	mov    %eax,%esi
    2466:	58                   	pop    %eax
    2467:	5a                   	pop    %edx
    2468:	51                   	push   %ecx
    2469:	56                   	push   %esi
    246a:	e8 b1 fe ff ff       	call   2320 <_ZNSt11logic_errorC1EPKc@plt>
    246f:	83 c4 0c             	add    $0xc,%esp
    2472:	ff b7 20 01 00 00    	push   0x120(%edi)
    2478:	ff b7 30 01 00 00    	push   0x130(%edi)
    247e:	56                   	push   %esi
    247f:	e8 1c ff ff ff       	call   23a0 <__cxa_throw@plt>
    2484:	83 ec 0c             	sub    $0xc,%esp
    2487:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    248a:	89 fb                	mov    %edi,%ebx
    248c:	56                   	push   %esi
    248d:	c5 f8 77             	vzeroupper
    2490:	e8 2b fd ff ff       	call   21c0 <__cxa_free_exception@plt>
    2495:	59                   	pop    %ecx
    2496:	ff 75 e4             	push   -0x1c(%ebp)
    2499:	e8 32 ff ff ff       	call   23d0 <_Unwind_Resume@plt>
    249e:	83 ec 0c             	sub    $0xc,%esp
    24a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    24a4:	89 fb                	mov    %edi,%ebx
    24a6:	56                   	push   %esi
    24a7:	c5 f8 77             	vzeroupper
    24aa:	e8 11 fd ff ff       	call   21c0 <__cxa_free_exception@plt>
    24af:	58                   	pop    %eax
    24b0:	ff 75 e4             	push   -0x1c(%ebp)
    24b3:	e8 18 ff ff ff       	call   23d0 <_Unwind_Resume@plt>

000024b8 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    24b8:	83 ec 0c             	sub    $0xc,%esp
    24bb:	ff 75 98             	push   -0x68(%ebp)
    24be:	89 f3                	mov    %esi,%ebx
    24c0:	c5 f8 77             	vzeroupper
    24c3:	e8 e8 fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    24c8:	83 c4 10             	add    $0x10,%esp
    24cb:	83 ec 0c             	sub    $0xc,%esp
    24ce:	ff 75 94             	push   -0x6c(%ebp)
    24d1:	89 f3                	mov    %esi,%ebx
    24d3:	e8 d8 fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    24d8:	83 c4 10             	add    $0x10,%esp
    24db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    24de:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    24e5:	75 09                	jne    24f0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x38>
    24e7:	83 ec 0c             	sub    $0xc,%esp
    24ea:	57                   	push   %edi
    24eb:	e8 e0 fe ff ff       	call   23d0 <_Unwind_Resume@plt>
    24f0:	e8 ab 84 00 00       	call   a9a0 <__stack_chk_fail_local>

000024f5 <_Z13validity_testPfS_j.cold>:
    24f5:	83 ec 0c             	sub    $0xc,%esp
    24f8:	ff 75 90             	push   -0x70(%ebp)
    24fb:	89 f3                	mov    %esi,%ebx
    24fd:	c5 f8 77             	vzeroupper
    2500:	e8 ab fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2505:	83 c4 10             	add    $0x10,%esp
    2508:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    250b:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2512:	75 31                	jne    2545 <_Z13validity_testPfS_j.cold+0x50>
    2514:	83 ec 0c             	sub    $0xc,%esp
    2517:	57                   	push   %edi
    2518:	e8 b3 fe ff ff       	call   23d0 <_Unwind_Resume@plt>
    251d:	83 ec 0c             	sub    $0xc,%esp
    2520:	89 f3                	mov    %esi,%ebx
    2522:	57                   	push   %edi
    2523:	c5 f8 77             	vzeroupper
    2526:	e8 85 fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    252b:	83 c4 10             	add    $0x10,%esp
    252e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2531:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2538:	75 0b                	jne    2545 <_Z13validity_testPfS_j.cold+0x50>
    253a:	83 ec 0c             	sub    $0xc,%esp
    253d:	ff 75 a4             	push   -0x5c(%ebp)
    2540:	e8 8b fe ff ff       	call   23d0 <_Unwind_Resume@plt>
    2545:	e8 56 84 00 00       	call   a9a0 <__stack_chk_fail_local>

0000254a <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    254a:	83 ec 0c             	sub    $0xc,%esp
    254d:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    2553:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
    2559:	c5 f8 77             	vzeroupper
    255c:	e8 4f fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2561:	83 c4 10             	add    $0x10,%esp
    2564:	83 ec 0c             	sub    $0xc,%esp
    2567:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    256d:	ff b5 60 ff ff ff    	push   -0xa0(%ebp)
    2573:	e8 38 fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2578:	83 c4 10             	add    $0x10,%esp
    257b:	83 ec 0c             	sub    $0xc,%esp
    257e:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    2584:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
    258a:	e8 21 fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    258f:	83 c4 10             	add    $0x10,%esp
    2592:	83 ec 0c             	sub    $0xc,%esp
    2595:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    259b:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    25a1:	e8 0a fd ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    25a6:	83 c4 10             	add    $0x10,%esp
    25a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    25ac:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    25b3:	75 0f                	jne    25c4 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x7a>
    25b5:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    25bb:	83 ec 0c             	sub    $0xc,%esp
    25be:	56                   	push   %esi
    25bf:	e8 0c fe ff ff       	call   23d0 <_Unwind_Resume@plt>
    25c4:	e8 d7 83 00 00       	call   a9a0 <__stack_chk_fail_local>

000025c9 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold>:
    25c9:	83 3f 00             	cmpl   $0x0,(%edi)
    25cc:	75 08                	jne    25d6 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0xd>
    25ce:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
    25d4:	89 07                	mov    %eax,(%edi)
    25d6:	83 ec 0c             	sub    $0xc,%esp
    25d9:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    25df:	ff b5 dc fe ff ff    	push   -0x124(%ebp)
    25e5:	c5 f8 77             	vzeroupper
    25e8:	e8 13 fb ff ff       	call   2100 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
    25ed:	83 c4 10             	add    $0x10,%esp
    25f0:	83 ec 0c             	sub    $0xc,%esp
    25f3:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    25f9:	ff b5 e0 fe ff ff    	push   -0x120(%ebp)
    25ff:	e8 ac fc ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2604:	83 c4 10             	add    $0x10,%esp
    2607:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    260a:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2611:	0f 85 f5 00 00 00    	jne    270c <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0x143>
    2617:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    261d:	83 ec 0c             	sub    $0xc,%esp
    2620:	56                   	push   %esi
    2621:	e8 aa fd ff ff       	call   23d0 <_Unwind_Resume@plt>
    2626:	8b 9d b0 fe ff ff    	mov    -0x150(%ebp),%ebx
    262c:	83 ec 0c             	sub    $0xc,%esp
    262f:	8d bd 44 ff ff ff    	lea    -0xbc(%ebp),%edi
    2635:	83 c3 08             	add    $0x8,%ebx
    2638:	89 9d 20 ff ff ff    	mov    %ebx,-0xe0(%ebp)
    263e:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    2644:	57                   	push   %edi
    2645:	c5 f8 77             	vzeroupper
    2648:	e8 63 fc ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    264d:	8b 8d c4 fe ff ff    	mov    -0x13c(%ebp),%ecx
    2653:	83 c1 08             	add    $0x8,%ecx
    2656:	89 8d 20 ff ff ff    	mov    %ecx,-0xe0(%ebp)
    265c:	59                   	pop    %ecx
    265d:	ff b5 c0 fe ff ff    	push   -0x140(%ebp)
    2663:	e8 a8 fc ff ff       	call   2310 <_ZNSt6localeD1Ev@plt>
    2668:	83 c4 10             	add    $0x10,%esp
    266b:	8b 9d bc fe ff ff    	mov    -0x144(%ebp),%ebx
    2671:	8b 8d b8 fe ff ff    	mov    -0x148(%ebp),%ecx
    2677:	31 d2                	xor    %edx,%edx
    2679:	8b 7b f4             	mov    -0xc(%ebx),%edi
    267c:	89 9d 18 ff ff ff    	mov    %ebx,-0xe8(%ebp)
    2682:	89 8c 3d 18 ff ff ff 	mov    %ecx,-0xe8(%ebp,%edi,1)
    2689:	89 95 1c ff ff ff    	mov    %edx,-0xe4(%ebp)
    268f:	8b 85 b4 fe ff ff    	mov    -0x14c(%ebp),%eax
    2695:	83 ec 0c             	sub    $0xc,%esp
    2698:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    269e:	83 c0 08             	add    $0x8,%eax
    26a1:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
    26a7:	ff b5 d0 fe ff ff    	push   -0x130(%ebp)
    26ad:	e8 ee f9 ff ff       	call   20a0 <_ZNSt8ios_baseD2Ev@plt>
    26b2:	8d 9d 00 ff ff ff    	lea    -0x100(%ebp),%ebx
    26b8:	83 c4 10             	add    $0x10,%esp
    26bb:	89 9d e0 fe ff ff    	mov    %ebx,-0x120(%ebp)
    26c1:	e9 2a ff ff ff       	jmp    25f0 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0x27>
    26c6:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    26cc:	83 ec 0c             	sub    $0xc,%esp
    26cf:	8d 95 44 ff ff ff    	lea    -0xbc(%ebp),%edx
    26d5:	52                   	push   %edx
    26d6:	c5 f8 77             	vzeroupper
    26d9:	e8 d2 fb ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    26de:	83 c4 10             	add    $0x10,%esp
    26e1:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
    26e7:	83 ec 0c             	sub    $0xc,%esp
    26ea:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    26f0:	83 c0 08             	add    $0x8,%eax
    26f3:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
    26f9:	ff b5 c0 fe ff ff    	push   -0x140(%ebp)
    26ff:	e8 0c fc ff ff       	call   2310 <_ZNSt6localeD1Ev@plt>
    2704:	83 c4 10             	add    $0x10,%esp
    2707:	e9 5f ff ff ff       	jmp    266b <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0xa2>
    270c:	e8 8f 82 00 00       	call   a9a0 <__stack_chk_fail_local>

00002711 <main.cold>:
    2711:	83 ec 0c             	sub    $0xc,%esp
    2714:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    271a:	89 fb                	mov    %edi,%ebx
    271c:	c5 f8 77             	vzeroupper
    271f:	e8 8c fb ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2724:	83 c4 10             	add    $0x10,%esp
    2727:	83 ec 0c             	sub    $0xc,%esp
    272a:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
    2730:	89 fb                	mov    %edi,%ebx
    2732:	e8 79 fb ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2737:	83 c4 10             	add    $0x10,%esp
    273a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    273d:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2744:	75 1f                	jne    2765 <main.cold+0x54>
    2746:	83 ec 0c             	sub    $0xc,%esp
    2749:	56                   	push   %esi
    274a:	e8 81 fc ff ff       	call   23d0 <_Unwind_Resume@plt>
    274f:	83 ec 0c             	sub    $0xc,%esp
    2752:	89 fb                	mov    %edi,%ebx
    2754:	56                   	push   %esi
    2755:	c5 f8 77             	vzeroupper
    2758:	e8 53 fb ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    275d:	8b 75 84             	mov    -0x7c(%ebp),%esi
    2760:	83 c4 10             	add    $0x10,%esp
    2763:	eb c2                	jmp    2727 <main.cold+0x16>
    2765:	e8 36 82 00 00       	call   a9a0 <__stack_chk_fail_local>

0000276a <_Z18set_signal_handlerv.cold>:
    276a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    276d:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2774:	75 10                	jne    2786 <_Z18set_signal_handlerv.cold+0x1c>
    2776:	8d 8b 8e c5 ff ff    	lea    -0x3a72(%ebx),%ecx
    277c:	50                   	push   %eax
    277d:	50                   	push   %eax
    277e:	51                   	push   %ecx
    277f:	6a 01                	push   $0x1
    2781:	e8 fa fb ff ff       	call   2380 <err@plt>
    2786:	e8 15 82 00 00       	call   a9a0 <__stack_chk_fail_local>
    278b:	66 90                	xchg   %ax,%ax
    278d:	66 90                	xchg   %ax,%ax
    278f:	90                   	nop

00002790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>:
    2790:	55                   	push   %ebp
    2791:	57                   	push   %edi
    2792:	56                   	push   %esi
    2793:	89 c6                	mov    %eax,%esi
    2795:	53                   	push   %ebx
    2796:	89 d5                	mov    %edx,%ebp
    2798:	8d 56 08             	lea    0x8(%esi),%edx
    279b:	83 ec 2c             	sub    $0x2c,%esp
    279e:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    27a4:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    27a8:	31 c0                	xor    %eax,%eax
    27aa:	89 16                	mov    %edx,(%esi)
    27ac:	e8 7f 10 00 00       	call   3830 <__x86.get_pc_thunk.bx>
    27b1:	81 c3 0b c7 00 00    	add    $0xc70b,%ebx
    27b7:	85 ed                	test   %ebp,%ebp
    27b9:	0f 84 82 00 00 00    	je     2841 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xb1>
    27bf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    27c3:	83 ec 0c             	sub    $0xc,%esp
    27c6:	55                   	push   %ebp
    27c7:	e8 84 f9 ff ff       	call   2150 <strlen@plt>
    27cc:	83 c4 10             	add    $0x10,%esp
    27cf:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    27d3:	83 f8 0f             	cmp    $0xf,%eax
    27d6:	89 c7                	mov    %eax,%edi
    27d8:	89 44 24 18          	mov    %eax,0x18(%esp)
    27dc:	77 34                	ja     2812 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x82>
    27de:	83 f8 01             	cmp    $0x1,%eax
    27e1:	75 29                	jne    280c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x7c>
    27e3:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
    27e7:	88 46 08             	mov    %al,0x8(%esi)
    27ea:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    27ee:	89 5e 04             	mov    %ebx,0x4(%esi)
    27f1:	8b 36                	mov    (%esi),%esi
    27f3:	c6 04 1e 00          	movb   $0x0,(%esi,%ebx,1)
    27f7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    27fb:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2802:	75 38                	jne    283c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xac>
    2804:	83 c4 2c             	add    $0x2c,%esp
    2807:	5b                   	pop    %ebx
    2808:	5e                   	pop    %esi
    2809:	5f                   	pop    %edi
    280a:	5d                   	pop    %ebp
    280b:	c3                   	ret
    280c:	85 c0                	test   %eax,%eax
    280e:	74 da                	je     27ea <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x5a>
    2810:	eb 1c                	jmp    282e <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x9e>
    2812:	52                   	push   %edx
    2813:	6a 00                	push   $0x0
    2815:	8d 54 24 20          	lea    0x20(%esp),%edx
    2819:	52                   	push   %edx
    281a:	56                   	push   %esi
    281b:	e8 90 fb ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    2820:	89 c1                	mov    %eax,%ecx
    2822:	89 06                	mov    %eax,(%esi)
    2824:	8b 44 24 28          	mov    0x28(%esp),%eax
    2828:	83 c4 10             	add    $0x10,%esp
    282b:	89 46 08             	mov    %eax,0x8(%esi)
    282e:	50                   	push   %eax
    282f:	57                   	push   %edi
    2830:	55                   	push   %ebp
    2831:	51                   	push   %ecx
    2832:	e8 f9 f8 ff ff       	call   2130 <memcpy@plt>
    2837:	83 c4 10             	add    $0x10,%esp
    283a:	eb ae                	jmp    27ea <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x5a>
    283c:	e8 5f 81 00 00       	call   a9a0 <__stack_chk_fail_local>
    2841:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    2845:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    284c:	75 ee                	jne    283c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xac>
    284e:	83 ec 0c             	sub    $0xc,%esp
    2851:	8d ab e0 c5 ff ff    	lea    -0x3a20(%ebx),%ebp
    2857:	55                   	push   %ebp
    2858:	e8 53 f9 ff ff       	call   21b0 <_ZSt19__throw_logic_errorPKc@plt>
    285d:	8d 76 00             	lea    0x0(%esi),%esi

00002860 <_GLOBAL__sub_I__Z11gpl_stringsB5cxx11>:
    2860:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    2864:	83 e4 c0             	and    $0xffffffc0,%esp
    2867:	ff 71 fc             	push   -0x4(%ecx)
    286a:	55                   	push   %ebp
    286b:	89 e5                	mov    %esp,%ebp
    286d:	57                   	push   %edi
    286e:	56                   	push   %esi
    286f:	53                   	push   %ebx
    2870:	e8 bb 0f 00 00       	call   3830 <__x86.get_pc_thunk.bx>
    2875:	81 c3 47 c6 00 00    	add    $0xc647,%ebx
    287b:	51                   	push   %ecx
    287c:	8d b3 3c c6 ff ff    	lea    -0x39c4(%ebx),%esi
    2882:	8d bb 88 c1 ff ff    	lea    -0x3e78(%ebx),%edi
    2888:	8d 93 84 c6 ff ff    	lea    -0x397c(%ebx),%edx
    288e:	81 ec 28 01 00 00    	sub    $0x128,%esp
    2894:	c5 f9 6e c6          	vmovd  %esi,%xmm0
    2898:	c5 f9 6e d7          	vmovd  %edi,%xmm2
    289c:	8d 8b 86 c1 ff ff    	lea    -0x3e7a(%ebx),%ecx
    28a2:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    28a8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    28ab:	31 c0                	xor    %eax,%eax
    28ad:	c4 e3 79 22 ca 01    	vpinsrd $0x1,%edx,%xmm0,%xmm1
    28b3:	8d 83 14 c6 ff ff    	lea    -0x39ec(%ebx),%eax
    28b9:	8d b3 20 c7 ff ff    	lea    -0x38e0(%ebx),%esi
    28bf:	8d bb 64 c7 ff ff    	lea    -0x389c(%ebx),%edi
    28c5:	8d 93 c4 c6 ff ff    	lea    -0x393c(%ebx),%edx
    28cb:	c4 e3 69 22 d8 01    	vpinsrd $0x1,%eax,%xmm2,%xmm3
    28d1:	c5 f9 6e f6          	vmovd  %esi,%xmm6
    28d5:	8d b3 00 c9 ff ff    	lea    -0x3700(%ebx),%esi
    28db:	c5 e1 6c e1          	vpunpcklqdq %xmm1,%xmm3,%xmm4
    28df:	c5 f9 6e c9          	vmovd  %ecx,%xmm1
    28e3:	8d 8b f0 c6 ff ff    	lea    -0x3910(%ebx),%ecx
    28e9:	c4 e3 49 22 ff 01    	vpinsrd $0x1,%edi,%xmm6,%xmm7
    28ef:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    28f3:	8d bb 40 c9 ff ff    	lea    -0x36c0(%ebx),%edi
    28f9:	c4 e3 71 22 ea 01    	vpinsrd $0x1,%edx,%xmm1,%xmm5
    28ff:	c4 e3 71 22 f6 01    	vpinsrd $0x1,%esi,%xmm1,%xmm6
    2905:	c5 f9 62 d1          	vpunpckldq %xmm1,%xmm0,%xmm2
    2909:	c5 f9 7f a5 08 ff ff 	vmovdqa %xmm4,-0xf8(%ebp)
    2910:	ff 
    2911:	8d 93 80 c9 ff ff    	lea    -0x3680(%ebx),%edx
    2917:	c5 f9 6e e7          	vmovd  %edi,%xmm4
    291b:	c5 e9 6c df          	vpunpcklqdq %xmm7,%xmm2,%xmm3
    291f:	8d 8b 98 c8 ff ff    	lea    -0x3768(%ebx),%ecx
    2925:	8d b3 08 c8 ff ff    	lea    -0x37f8(%ebx),%esi
    292b:	c5 f9 d6 ad 28 ff ff 	vmovq  %xmm5,-0xd8(%ebp)
    2932:	ff 
    2933:	c5 f9 6e c1          	vmovd  %ecx,%xmm0
    2937:	c4 e3 59 22 ea 01    	vpinsrd $0x1,%edx,%xmm4,%xmm5
    293d:	c5 f9 7f 9d 18 ff ff 	vmovdqa %xmm3,-0xe8(%ebp)
    2944:	ff 
    2945:	8d 93 dc c8 ff ff    	lea    -0x3724(%ebx),%edx
    294b:	c5 f9 6e de          	vmovd  %esi,%xmm3
    294f:	8d bb 50 c8 ff ff    	lea    -0x37b0(%ebx),%edi
    2955:	c5 c9 6c fd          	vpunpcklqdq %xmm5,%xmm6,%xmm7
    2959:	c4 e3 79 22 d2 01    	vpinsrd $0x1,%edx,%xmm0,%xmm2
    295f:	c4 e3 61 22 e7 01    	vpinsrd $0x1,%edi,%xmm3,%xmm4
    2965:	c5 f9 6e f0          	vmovd  %eax,%xmm6
    2969:	8d 83 e8 c7 ff ff    	lea    -0x3818(%ebx),%eax
    296f:	8d 8b 94 c1 ff ff    	lea    -0x3e6c(%ebx),%ecx
    2975:	c5 d9 6c ea          	vpunpcklqdq %xmm2,%xmm4,%xmm5
    2979:	c5 f9 6e c0          	vmovd  %eax,%xmm0
    297d:	8d 93 ac c7 ff ff    	lea    -0x3854(%ebx),%edx
    2983:	c5 f9 7e 8d 30 ff ff 	vmovd  %xmm1,-0xd0(%ebp)
    298a:	ff 
    298b:	c5 f9 62 d9          	vpunpckldq %xmm1,%xmm0,%xmm3
    298f:	c4 e3 55 38 d7 01    	vinserti128 $0x1,%xmm7,%ymm5,%ymm2
    2995:	8d bb af c1 ff ff    	lea    -0x3e51(%ebx),%edi
    299b:	c4 e3 71 22 ea 01    	vpinsrd $0x1,%edx,%xmm1,%xmm5
    29a1:	c5 c9 62 f9          	vpunpckldq %xmm1,%xmm6,%xmm7
    29a5:	c5 f9 6e c9          	vmovd  %ecx,%xmm1
    29a9:	8d 93 c7 c1 ff ff    	lea    -0x3e39(%ebx),%edx
    29af:	8d b3 48 01 00 00    	lea    0x148(%ebx),%esi
    29b5:	c4 e3 71 22 f7 01    	vpinsrd $0x1,%edi,%xmm1,%xmm6
    29bb:	c5 e1 6c e7          	vpunpcklqdq %xmm7,%xmm3,%xmm4
    29bf:	8d bb 38 03 00 00    	lea    0x338(%ebx),%edi
    29c5:	c5 c9 6c fd          	vpunpcklqdq %xmm5,%xmm6,%xmm7
    29c9:	89 f8                	mov    %edi,%eax
    29cb:	c4 e3 45 38 c4 01    	vinserti128 $0x1,%xmm4,%ymm7,%ymm0
    29d1:	62 f3 fd 48 3a d2 01 	vinserti64x4 $0x1,%ymm2,%zmm0,%zmm2
    29d8:	62 f1 7d 48 7f 95 c8 	vmovdqa32 %zmm2,-0x138(%ebp)
    29df:	fe ff ff 
    29e2:	c5 f8 77             	vzeroupper
    29e5:	e8 a6 fd ff ff       	call   2790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    29ea:	83 ec 04             	sub    $0x4,%esp
    29ed:	56                   	push   %esi
    29ee:	57                   	push   %edi
    29ef:	8b bb 14 01 00 00    	mov    0x114(%ebx),%edi
    29f5:	57                   	push   %edi
    29f6:	e8 a5 f7 ff ff       	call   21a0 <__cxa_atexit@plt>
    29fb:	83 c4 10             	add    $0x10,%esp
    29fe:	8d 93 cb c1 ff ff    	lea    -0x3e35(%ebx),%edx
    2a04:	8d 83 20 03 00 00    	lea    0x320(%ebx),%eax
    2a0a:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
    2a10:	e8 7b fd ff ff       	call   2790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    2a15:	83 ec 04             	sub    $0x4,%esp
    2a18:	56                   	push   %esi
    2a19:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
    2a1f:	50                   	push   %eax
    2a20:	57                   	push   %edi
    2a21:	e8 7a f7 ff ff       	call   21a0 <__cxa_atexit@plt>
    2a26:	83 c4 10             	add    $0x10,%esp
    2a29:	8d 83 08 03 00 00    	lea    0x308(%ebx),%eax
    2a2f:	8d 93 cf c1 ff ff    	lea    -0x3e31(%ebx),%edx
    2a35:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
    2a3b:	e8 50 fd ff ff       	call   2790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    2a40:	83 ec 04             	sub    $0x4,%esp
    2a43:	56                   	push   %esi
    2a44:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
    2a4a:	52                   	push   %edx
    2a4b:	57                   	push   %edi
    2a4c:	e8 4f f7 ff ff       	call   21a0 <__cxa_atexit@plt>
    2a51:	83 c4 10             	add    $0x10,%esp
    2a54:	8d 93 d3 c1 ff ff    	lea    -0x3e2d(%ebx),%edx
    2a5a:	8d 83 f0 02 00 00    	lea    0x2f0(%ebx),%eax
    2a60:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
    2a66:	e8 25 fd ff ff       	call   2790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    2a6b:	83 ec 04             	sub    $0x4,%esp
    2a6e:	56                   	push   %esi
    2a6f:	8b 8d 34 ff ff ff    	mov    -0xcc(%ebp),%ecx
    2a75:	51                   	push   %ecx
    2a76:	57                   	push   %edi
    2a77:	e8 24 f7 ff ff       	call   21a0 <__cxa_atexit@plt>
    2a7c:	83 c4 10             	add    $0x10,%esp
    2a7f:	8d 93 d7 c1 ff ff    	lea    -0x3e29(%ebx),%edx
    2a85:	8d 83 d8 02 00 00    	lea    0x2d8(%ebx),%eax
    2a8b:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
    2a91:	e8 fa fc ff ff       	call   2790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    2a96:	83 ec 04             	sub    $0x4,%esp
    2a99:	56                   	push   %esi
    2a9a:	8b 85 34 ff ff ff    	mov    -0xcc(%ebp),%eax
    2aa0:	50                   	push   %eax
    2aa1:	57                   	push   %edi
    2aa2:	e8 f9 f6 ff ff       	call   21a0 <__cxa_atexit@plt>
    2aa7:	83 c4 10             	add    $0x10,%esp
    2aaa:	8d 83 c0 02 00 00    	lea    0x2c0(%ebx),%eax
    2ab0:	8d 93 db c1 ff ff    	lea    -0x3e25(%ebx),%edx
    2ab6:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
    2abc:	e8 cf fc ff ff       	call   2790 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    2ac1:	83 ec 04             	sub    $0x4,%esp
    2ac4:	56                   	push   %esi
    2ac5:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
    2acb:	52                   	push   %edx
    2acc:	57                   	push   %edi
    2acd:	8d bd 47 ff ff ff    	lea    -0xb9(%ebp),%edi
    2ad3:	e8 c8 f6 ff ff       	call   21a0 <__cxa_atexit@plt>
    2ad8:	62 f1 7d 48 6f 9d c8 	vmovdqa32 -0x138(%ebp),%zmm3
    2adf:	fe ff ff 
    2ae2:	c5 f9 6f a5 18 ff ff 	vmovdqa -0xe8(%ebp),%xmm4
    2ae9:	ff 
    2aea:	83 c4 10             	add    $0x10,%esp
    2aed:	c5 fa 7e ad 28 ff ff 	vmovq  -0xd8(%ebp),%xmm5
    2af4:	ff 
    2af5:	8d 83 b4 02 00 00    	lea    0x2b4(%ebx),%eax
    2afb:	8d 4d a4             	lea    -0x5c(%ebp),%ecx
    2afe:	c5 f9 6e 8d 30 ff ff 	vmovd  -0xd0(%ebp),%xmm1
    2b05:	ff 
    2b06:	c5 f9 7f 65 88       	vmovdqa %xmm4,-0x78(%ebp)
    2b0b:	c5 f9 d6 6d 98       	vmovq  %xmm5,-0x68(%ebp)
    2b10:	c5 f9 7e 4d a0       	vmovd  %xmm1,-0x60(%ebp)
    2b15:	62 f1 7d 48 7f 9d 48 	vmovdqa32 %zmm3,-0xb8(%ebp)
    2b1c:	ff ff ff 
    2b1f:	57                   	push   %edi
    2b20:	89 bd c8 fe ff ff    	mov    %edi,-0x138(%ebp)
    2b26:	8d bd 48 ff ff ff    	lea    -0xb8(%ebp),%edi
    2b2c:	51                   	push   %ecx
    2b2d:	57                   	push   %edi
    2b2e:	50                   	push   %eax
    2b2f:	89 85 34 ff ff ff    	mov    %eax,-0xcc(%ebp)
    2b35:	c5 f8 77             	vzeroupper
    2b38:	e8 73 38 00 00       	call   63b0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_>
    2b3d:	83 c4 0c             	add    $0xc,%esp
    2b40:	8d 8b 84 74 ff ff    	lea    -0x8b7c(%ebx),%ecx
    2b46:	56                   	push   %esi
    2b47:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
    2b4d:	52                   	push   %edx
    2b4e:	51                   	push   %ecx
    2b4f:	89 8d 34 ff ff ff    	mov    %ecx,-0xcc(%ebp)
    2b55:	e8 46 f6 ff ff       	call   21a0 <__cxa_atexit@plt>
    2b5a:	c5 f9 6f b5 08 ff ff 	vmovdqa -0xf8(%ebp),%xmm6
    2b61:	ff 
    2b62:	8b 95 c8 fe ff ff    	mov    -0x138(%ebp),%edx
    2b68:	83 c4 10             	add    $0x10,%esp
    2b6b:	8d 83 c0 c9 ff ff    	lea    -0x3640(%ebx),%eax
    2b71:	8d 8d 5c ff ff ff    	lea    -0xa4(%ebp),%ecx
    2b77:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
    2b7d:	c5 f9 7f b5 48 ff ff 	vmovdqa %xmm6,-0xb8(%ebp)
    2b84:	ff 
    2b85:	52                   	push   %edx
    2b86:	51                   	push   %ecx
    2b87:	57                   	push   %edi
    2b88:	8d bb a8 02 00 00    	lea    0x2a8(%ebx),%edi
    2b8e:	57                   	push   %edi
    2b8f:	e8 1c 38 00 00       	call   63b0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_>
    2b94:	83 c4 0c             	add    $0xc,%esp
    2b97:	56                   	push   %esi
    2b98:	57                   	push   %edi
    2b99:	8b b5 34 ff ff ff    	mov    -0xcc(%ebp),%esi
    2b9f:	56                   	push   %esi
    2ba0:	e8 fb f5 ff ff       	call   21a0 <__cxa_atexit@plt>
    2ba5:	83 c4 10             	add    $0x10,%esp
    2ba8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2bab:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    2bb2:	75 0c                	jne    2bc0 <_GLOBAL__sub_I__Z11gpl_stringsB5cxx11+0x360>
    2bb4:	8d 65 f0             	lea    -0x10(%ebp),%esp
    2bb7:	59                   	pop    %ecx
    2bb8:	5b                   	pop    %ebx
    2bb9:	5e                   	pop    %esi
    2bba:	5f                   	pop    %edi
    2bbb:	5d                   	pop    %ebp
    2bbc:	8d 61 fc             	lea    -0x4(%ecx),%esp
    2bbf:	c3                   	ret
    2bc0:	e8 db 7d 00 00       	call   a9a0 <__stack_chk_fail_local>
    2bc5:	66 90                	xchg   %ax,%ax
    2bc7:	66 90                	xchg   %ax,%ax
    2bc9:	66 90                	xchg   %ax,%ax
    2bcb:	66 90                	xchg   %ax,%ax
    2bcd:	66 90                	xchg   %ax,%ax
    2bcf:	90                   	nop

00002bd0 <main>:
    2bd0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    2bd4:	83 e4 f0             	and    $0xfffffff0,%esp
    2bd7:	ff 71 fc             	push   -0x4(%ecx)
    2bda:	55                   	push   %ebp
    2bdb:	89 e5                	mov    %esp,%ebp
    2bdd:	57                   	push   %edi
    2bde:	56                   	push   %esi
    2bdf:	53                   	push   %ebx
    2be0:	51                   	push   %ecx
    2be1:	8d 5d 8f             	lea    -0x71(%ebp),%ebx
    2be4:	8d 75 c8             	lea    -0x38(%ebp),%esi
    2be7:	81 ec a4 00 00 00    	sub    $0xa4,%esp
    2bed:	8b 01                	mov    (%ecx),%eax
    2bef:	8b 51 04             	mov    0x4(%ecx),%edx
    2bf2:	e8 3b 0e 00 00       	call   3a32 <__x86.get_pc_thunk.di>
    2bf7:	81 c7 c5 c2 00 00    	add    $0xc2c5,%edi
    2bfd:	89 55 80             	mov    %edx,-0x80(%ebp)
    2c00:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
    2c06:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    2c0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2c0f:	31 c0                	xor    %eax,%eax
    2c11:	53                   	push   %ebx
    2c12:	89 fb                	mov    %edi,%ebx
    2c14:	e8 17 78 00 00       	call   a430 <_ZN13SignalHandlerC1Ev>
    2c19:	8d 45 98             	lea    -0x68(%ebp),%eax
    2c1c:	83 c4 10             	add    $0x10,%esp
    2c1f:	8d 97 da c3 ff ff    	lea    -0x3c26(%edi),%edx
    2c25:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
    2c2b:	e8 e0 3f 00 00       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    2c30:	8b 45 98             	mov    -0x68(%ebp),%eax
    2c33:	89 b5 68 ff ff ff    	mov    %esi,-0x98(%ebp)
    2c39:	8b 75 9c             	mov    -0x64(%ebp),%esi
    2c3c:	8d 4d d0             	lea    -0x30(%ebp),%ecx
    2c3f:	89 8d 6c ff ff ff    	mov    %ecx,-0x94(%ebp)
    2c45:	89 4d c8             	mov    %ecx,-0x38(%ebp)
    2c48:	89 45 84             	mov    %eax,-0x7c(%ebp)
    2c4b:	89 75 94             	mov    %esi,-0x6c(%ebp)
    2c4e:	83 fe 0f             	cmp    $0xf,%esi
    2c51:	0f 87 b9 08 00 00    	ja     3510 <.L564+0x680>
    2c57:	83 fe 01             	cmp    $0x1,%esi
    2c5a:	0f 85 cc 02 00 00    	jne    2f2c <.L564+0x9c>
    2c60:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2c63:	0f b6 1a             	movzbl (%edx),%ebx
    2c66:	88 5d d0             	mov    %bl,-0x30(%ebp)
    2c69:	8b 45 94             	mov    -0x6c(%ebp),%eax
    2c6c:	8b 75 c8             	mov    -0x38(%ebp),%esi
    2c6f:	83 ec 0c             	sub    $0xc,%esp
    2c72:	89 fb                	mov    %edi,%ebx
    2c74:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2c77:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
    2c7b:	8b b5 68 ff ff ff    	mov    -0x98(%ebp),%esi
    2c81:	56                   	push   %esi
    2c82:	e8 f9 33 00 00       	call   6080 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    2c87:	89 34 24             	mov    %esi,(%esp)
    2c8a:	e8 21 f6 ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2c8f:	8b 87 3c 01 00 00    	mov    0x13c(%edi),%eax
    2c95:	8b b7 28 01 00 00    	mov    0x128(%edi),%esi
    2c9b:	8d 5d 90             	lea    -0x70(%ebp),%ebx
    2c9e:	8d 8f 64 01 00 00    	lea    0x164(%edi),%ecx
    2ca4:	8d 97 e6 c3 ff ff    	lea    -0x3c1a(%edi),%edx
    2caa:	83 c4 10             	add    $0x10,%esp
    2cad:	89 9d 74 ff ff ff    	mov    %ebx,-0x8c(%ebp)
    2cb3:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
    2cb6:	89 95 78 ff ff ff    	mov    %edx,-0x88(%ebp)
    2cbc:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
    2cc2:	89 b5 60 ff ff ff    	mov    %esi,-0xa0(%ebp)
    2cc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2ccf:	00 
    2cd0:	83 ec 0c             	sub    $0xc,%esp
    2cd3:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
    2cda:	ff b5 74 ff ff ff    	push   -0x8c(%ebp)
    2ce0:	ff 75 84             	push   -0x7c(%ebp)
    2ce3:	ff b5 78 ff ff ff    	push   -0x88(%ebp)
    2ce9:	89 fb                	mov    %edi,%ebx
    2ceb:	ff 75 80             	push   -0x80(%ebp)
    2cee:	ff b5 7c ff ff ff    	push   -0x84(%ebp)
    2cf4:	e8 c7 f3 ff ff       	call   20c0 <getopt_long@plt>
    2cf9:	83 c4 20             	add    $0x20,%esp
    2cfc:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cff:	0f 84 3b 04 00 00    	je     3140 <.L564+0x2b0>
    2d05:	85 c0                	test   %eax,%eax
    2d07:	0f 84 33 02 00 00    	je     2f40 <.L564+0xb0>
    2d0d:	83 e8 61             	sub    $0x61,%eax
    2d10:	83 f8 19             	cmp    $0x19,%eax
    2d13:	0f 87 86 08 00 00    	ja     359f <.L553>
    2d19:	8b 84 87 84 ce ff ff 	mov    -0x317c(%edi,%eax,4),%eax
    2d20:	01 f8                	add    %edi,%eax
    2d22:	ff e0                	jmp    *%eax
    2d24:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2d2b:	00 
    2d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002d30 <.L554>:
    2d30:	8b b7 28 01 00 00    	mov    0x128(%edi),%esi
    2d36:	83 ec 04             	sub    $0x4,%esp
    2d39:	6a 0a                	push   $0xa
    2d3b:	6a 00                	push   $0x0
    2d3d:	ff 36                	push   (%esi)
    2d3f:	e8 ac f6 ff ff       	call   23f0 <__isoc23_strtol@plt>
    2d44:	83 c4 10             	add    $0x10,%esp
    2d47:	89 87 54 01 00 00    	mov    %eax,0x154(%edi)
    2d4d:	eb 81                	jmp    2cd0 <main+0x100>
    2d4f:	90                   	nop

00002d50 <.L556>:
    2d50:	c6 87 50 03 00 00 01 	movb   $0x1,0x350(%edi)
    2d57:	e9 74 ff ff ff       	jmp    2cd0 <main+0x100>
    2d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002d60 <.L557>:
    2d60:	c6 87 84 03 00 00 01 	movb   $0x1,0x384(%edi)
    2d67:	e9 64 ff ff ff       	jmp    2cd0 <main+0x100>
    2d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002d70 <.L558>:
    2d70:	8b 97 28 01 00 00    	mov    0x128(%edi),%edx
    2d76:	83 ec 04             	sub    $0x4,%esp
    2d79:	6a 0a                	push   $0xa
    2d7b:	6a 00                	push   $0x0
    2d7d:	ff 32                	push   (%edx)
    2d7f:	e8 6c f6 ff ff       	call   23f0 <__isoc23_strtol@plt>
    2d84:	83 c4 10             	add    $0x10,%esp
    2d87:	89 87 58 01 00 00    	mov    %eax,0x158(%edi)
    2d8d:	e9 3e ff ff ff       	jmp    2cd0 <main+0x100>
    2d92:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2d99:	00 
    2d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00002da0 <.L559>:
    2da0:	8b 9f 28 01 00 00    	mov    0x128(%edi),%ebx
    2da6:	83 ec 0c             	sub    $0xc,%esp
    2da9:	8b 33                	mov    (%ebx),%esi
    2dab:	89 fb                	mov    %edi,%ebx
    2dad:	56                   	push   %esi
    2dae:	e8 9d f3 ff ff       	call   2150 <strlen@plt>
    2db3:	8d 8f 54 03 00 00    	lea    0x354(%edi),%ecx
    2db9:	89 04 24             	mov    %eax,(%esp)
    2dbc:	56                   	push   %esi
    2dbd:	ff b7 58 03 00 00    	push   0x358(%edi)
    2dc3:	6a 00                	push   $0x0
    2dc5:	51                   	push   %ecx
    2dc6:	e8 15 f3 ff ff       	call   20e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEjjPKcj@plt>
    2dcb:	83 c4 20             	add    $0x20,%esp
    2dce:	e9 fd fe ff ff       	jmp    2cd0 <main+0x100>
    2dd3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2dda:	00 
    2ddb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00002de0 <.L560>:
    2de0:	8b 87 28 01 00 00    	mov    0x128(%edi),%eax
    2de6:	83 ec 04             	sub    $0x4,%esp
    2de9:	6a 0a                	push   $0xa
    2deb:	6a 00                	push   $0x0
    2ded:	ff 30                	push   (%eax)
    2def:	e8 fc f5 ff ff       	call   23f0 <__isoc23_strtol@plt>
    2df4:	83 c4 10             	add    $0x10,%esp
    2df7:	89 87 5c 01 00 00    	mov    %eax,0x15c(%edi)
    2dfd:	e9 ce fe ff ff       	jmp    2cd0 <main+0x100>
    2e02:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2e09:	00 
    2e0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00002e10 <.L563>:
    2e10:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    2e16:	8b 4d 98             	mov    -0x68(%ebp),%ecx
    2e19:	8b 75 9c             	mov    -0x64(%ebp),%esi
    2e1c:	89 5d c8             	mov    %ebx,-0x38(%ebp)
    2e1f:	89 8d 64 ff ff ff    	mov    %ecx,-0x9c(%ebp)
    2e25:	89 75 94             	mov    %esi,-0x6c(%ebp)
    2e28:	83 fe 0f             	cmp    $0xf,%esi
    2e2b:	0f 87 5f 02 00 00    	ja     3090 <.L564+0x200>
    2e31:	83 fe 01             	cmp    $0x1,%esi
    2e34:	0f 84 26 02 00 00    	je     3060 <.L564+0x1d0>
    2e3a:	85 f6                	test   %esi,%esi
    2e3c:	0f 85 01 07 00 00    	jne    3543 <.L564+0x6b3>
    2e42:	8b 8d 6c ff ff ff    	mov    -0x94(%ebp),%ecx
    2e48:	89 75 cc             	mov    %esi,-0x34(%ebp)
    2e4b:	83 ec 0c             	sub    $0xc,%esp
    2e4e:	c6 04 31 00          	movb   $0x0,(%ecx,%esi,1)
    2e52:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    2e58:	89 fb                	mov    %edi,%ebx
    2e5a:	e8 81 33 00 00       	call   61e0 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    2e5f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2e62:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    2e68:	83 c4 10             	add    $0x10,%esp
    2e6b:	39 d0                	cmp    %edx,%eax
    2e6d:	0f 84 5d fe ff ff    	je     2cd0 <main+0x100>
    2e73:	83 ec 0c             	sub    $0xc,%esp
    2e76:	50                   	push   %eax
    2e77:	e8 d4 f3 ff ff       	call   2250 <_ZdlPv@plt>
    2e7c:	83 c4 10             	add    $0x10,%esp
    2e7f:	e9 4c fe ff ff       	jmp    2cd0 <main+0x100>
    2e84:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2e8b:	00 
    2e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002e90 <.L564>:
    2e90:	8b 9f 28 01 00 00    	mov    0x128(%edi),%ebx
    2e96:	8b 8d 6c ff ff ff    	mov    -0x94(%ebp),%ecx
    2e9c:	8b 33                	mov    (%ebx),%esi
    2e9e:	89 4d c8             	mov    %ecx,-0x38(%ebp)
    2ea1:	89 b5 64 ff ff ff    	mov    %esi,-0x9c(%ebp)
    2ea7:	85 f6                	test   %esi,%esi
    2ea9:	0f 84 9a 07 00 00    	je     3649 <.L561+0x4d>
    2eaf:	83 ec 0c             	sub    $0xc,%esp
    2eb2:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
    2eb8:	89 fb                	mov    %edi,%ebx
    2eba:	e8 91 f2 ff ff       	call   2150 <strlen@plt>
    2ebf:	83 c4 10             	add    $0x10,%esp
    2ec2:	89 c6                	mov    %eax,%esi
    2ec4:	89 45 94             	mov    %eax,-0x6c(%ebp)
    2ec7:	83 f8 0f             	cmp    $0xf,%eax
    2eca:	0f 87 10 02 00 00    	ja     30e0 <.L564+0x250>
    2ed0:	83 f8 01             	cmp    $0x1,%eax
    2ed3:	0f 84 97 01 00 00    	je     3070 <.L564+0x1e0>
    2ed9:	85 c0                	test   %eax,%eax
    2edb:	0f 85 6d 06 00 00    	jne    354e <.L564+0x6be>
    2ee1:	8b b5 6c ff ff ff    	mov    -0x94(%ebp),%esi
    2ee7:	83 ec 04             	sub    $0x4,%esp
    2eea:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2eed:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
    2ef1:	8d 97 6c 03 00 00    	lea    0x36c(%edi),%edx
    2ef7:	6a 2c                	push   $0x2c
    2ef9:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    2eff:	52                   	push   %edx
    2f00:	e8 0b 56 00 00       	call   8510 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc>
    2f05:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    2f08:	8b 8d 6c ff ff ff    	mov    -0x94(%ebp),%ecx
    2f0e:	83 c4 10             	add    $0x10,%esp
    2f11:	39 cb                	cmp    %ecx,%ebx
    2f13:	0f 84 b7 fd ff ff    	je     2cd0 <main+0x100>
    2f19:	83 ec 0c             	sub    $0xc,%esp
    2f1c:	53                   	push   %ebx
    2f1d:	89 fb                	mov    %edi,%ebx
    2f1f:	e8 2c f3 ff ff       	call   2250 <_ZdlPv@plt>
    2f24:	83 c4 10             	add    $0x10,%esp
    2f27:	e9 a4 fd ff ff       	jmp    2cd0 <main+0x100>
    2f2c:	85 f6                	test   %esi,%esi
    2f2e:	0f 84 35 fd ff ff    	je     2c69 <main+0x99>
    2f34:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    2f3a:	e9 ef 05 00 00       	jmp    352e <.L564+0x69e>
    2f3f:	90                   	nop
    2f40:	83 ec 04             	sub    $0x4,%esp
    2f43:	8d 9f f6 c3 ff ff    	lea    -0x3c0a(%edi),%ebx
    2f49:	6a 07                	push   $0x7
    2f4b:	53                   	push   %ebx
    2f4c:	ff b5 70 ff ff ff    	push   -0x90(%ebp)
    2f52:	89 fb                	mov    %edi,%ebx
    2f54:	e8 87 f3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    2f59:	8b 45 84             	mov    -0x7c(%ebp),%eax
    2f5c:	b9 04 00 00 00       	mov    $0x4,%ecx
    2f61:	c4 e2 71 f7 55 90    	shlx   %ecx,-0x70(%ebp),%edx
    2f67:	83 c4 10             	add    $0x10,%esp
    2f6a:	8b 34 10             	mov    (%eax,%edx,1),%esi
    2f6d:	85 f6                	test   %esi,%esi
    2f6f:	0f 84 ab 01 00 00    	je     3120 <.L564+0x290>
    2f75:	83 ec 0c             	sub    $0xc,%esp
    2f78:	56                   	push   %esi
    2f79:	e8 d2 f1 ff ff       	call   2150 <strlen@plt>
    2f7e:	83 c4 0c             	add    $0xc,%esp
    2f81:	50                   	push   %eax
    2f82:	56                   	push   %esi
    2f83:	ff b5 70 ff ff ff    	push   -0x90(%ebp)
    2f89:	e8 52 f3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    2f8e:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
    2f94:	83 c4 10             	add    $0x10,%esp
    2f97:	8b 1e                	mov    (%esi),%ebx
    2f99:	85 db                	test   %ebx,%ebx
    2f9b:	74 42                	je     2fdf <.L564+0x14f>
    2f9d:	83 ec 04             	sub    $0x4,%esp
    2fa0:	8d 8f fe c3 ff ff    	lea    -0x3c02(%edi),%ecx
    2fa6:	89 fb                	mov    %edi,%ebx
    2fa8:	6a 0a                	push   $0xa
    2faa:	51                   	push   %ecx
    2fab:	ff b5 70 ff ff ff    	push   -0x90(%ebp)
    2fb1:	e8 2a f3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    2fb6:	8b 36                	mov    (%esi),%esi
    2fb8:	83 c4 10             	add    $0x10,%esp
    2fbb:	85 f6                	test   %esi,%esi
    2fbd:	0f 84 2d 05 00 00    	je     34f0 <.L564+0x660>
    2fc3:	83 ec 0c             	sub    $0xc,%esp
    2fc6:	56                   	push   %esi
    2fc7:	e8 84 f1 ff ff       	call   2150 <strlen@plt>
    2fcc:	83 c4 0c             	add    $0xc,%esp
    2fcf:	50                   	push   %eax
    2fd0:	56                   	push   %esi
    2fd1:	ff b5 70 ff ff ff    	push   -0x90(%ebp)
    2fd7:	e8 04 f3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    2fdc:	83 c4 10             	add    $0x10,%esp
    2fdf:	8b 9d 70 ff ff ff    	mov    -0x90(%ebp),%ebx
    2fe5:	8b 33                	mov    (%ebx),%esi
    2fe7:	8b 46 f4             	mov    -0xc(%esi),%eax
    2fea:	8b 74 18 7c          	mov    0x7c(%eax,%ebx,1),%esi
    2fee:	85 f6                	test   %esi,%esi
    2ff0:	0f 84 70 06 00 00    	je     3666 <.L561+0x6a>
    2ff6:	80 7e 1c 00          	cmpb   $0x0,0x1c(%esi)
    2ffa:	74 24                	je     3020 <.L564+0x190>
    2ffc:	0f be 46 27          	movsbl 0x27(%esi),%eax
    3000:	83 ec 08             	sub    $0x8,%esp
    3003:	89 fb                	mov    %edi,%ebx
    3005:	50                   	push   %eax
    3006:	ff b5 70 ff ff ff    	push   -0x90(%ebp)
    300c:	e8 2f f0 ff ff       	call   2040 <_ZNSo3putEc@plt>
    3011:	89 04 24             	mov    %eax,(%esp)
    3014:	e8 77 f1 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    3019:	e9 06 ff ff ff       	jmp    2f24 <.L564+0x94>
    301e:	66 90                	xchg   %ax,%ax
    3020:	83 ec 0c             	sub    $0xc,%esp
    3023:	89 fb                	mov    %edi,%ebx
    3025:	56                   	push   %esi
    3026:	e8 75 f2 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    302b:	8b 16                	mov    (%esi),%edx
    302d:	8d 8f 74 74 ff ff    	lea    -0x8b8c(%edi),%ecx
    3033:	83 c4 10             	add    $0x10,%esp
    3036:	b8 0a 00 00 00       	mov    $0xa,%eax
    303b:	8b 5a 18             	mov    0x18(%edx),%ebx
    303e:	39 cb                	cmp    %ecx,%ebx
    3040:	74 be                	je     3000 <.L564+0x170>
    3042:	50                   	push   %eax
    3043:	50                   	push   %eax
    3044:	6a 0a                	push   $0xa
    3046:	56                   	push   %esi
    3047:	ff d3                	call   *%ebx
    3049:	83 c4 10             	add    $0x10,%esp
    304c:	0f be c0             	movsbl %al,%eax
    304f:	eb af                	jmp    3000 <.L564+0x170>
    3051:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3058:	00 
    3059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3060:	0f b6 01             	movzbl (%ecx),%eax
    3063:	88 45 d0             	mov    %al,-0x30(%ebp)
    3066:	e9 d7 fd ff ff       	jmp    2e42 <.L563+0x32>
    306b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    3070:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
    3076:	0f b6 1a             	movzbl (%edx),%ebx
    3079:	88 5d d0             	mov    %bl,-0x30(%ebp)
    307c:	e9 60 fe ff ff       	jmp    2ee1 <.L564+0x51>
    3081:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3088:	00 
    3089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3090:	83 ec 04             	sub    $0x4,%esp
    3093:	8d 55 94             	lea    -0x6c(%ebp),%edx
    3096:	89 fb                	mov    %edi,%ebx
    3098:	6a 00                	push   $0x0
    309a:	52                   	push   %edx
    309b:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    30a1:	e8 0a f3 ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    30a6:	8b 5d 94             	mov    -0x6c(%ebp),%ebx
    30a9:	83 c4 10             	add    $0x10,%esp
    30ac:	89 45 c8             	mov    %eax,-0x38(%ebp)
    30af:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    30b2:	83 ec 04             	sub    $0x4,%esp
    30b5:	89 fb                	mov    %edi,%ebx
    30b7:	56                   	push   %esi
    30b8:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
    30be:	50                   	push   %eax
    30bf:	e8 6c f0 ff ff       	call   2130 <memcpy@plt>
    30c4:	8b 75 94             	mov    -0x6c(%ebp),%esi
    30c7:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    30ca:	83 c4 10             	add    $0x10,%esp
    30cd:	e9 76 fd ff ff       	jmp    2e48 <.L563+0x38>
    30d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    30d9:	00 
    30da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    30e0:	83 ec 04             	sub    $0x4,%esp
    30e3:	8d 45 94             	lea    -0x6c(%ebp),%eax
    30e6:	6a 00                	push   $0x0
    30e8:	50                   	push   %eax
    30e9:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    30ef:	e8 bc f2 ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    30f4:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
    30f7:	83 c4 10             	add    $0x10,%esp
    30fa:	89 45 c8             	mov    %eax,-0x38(%ebp)
    30fd:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    3100:	83 ec 04             	sub    $0x4,%esp
    3103:	89 fb                	mov    %edi,%ebx
    3105:	56                   	push   %esi
    3106:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
    310c:	50                   	push   %eax
    310d:	e8 1e f0 ff ff       	call   2130 <memcpy@plt>
    3112:	8b 45 94             	mov    -0x6c(%ebp),%eax
    3115:	8b 75 c8             	mov    -0x38(%ebp),%esi
    3118:	83 c4 10             	add    $0x10,%esp
    311b:	e9 c7 fd ff ff       	jmp    2ee7 <.L564+0x57>
    3120:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
    3126:	83 ec 08             	sub    $0x8,%esp
    3129:	8b 0a                	mov    (%edx),%ecx
    312b:	03 51 f4             	add    -0xc(%ecx),%edx
    312e:	8b 42 14             	mov    0x14(%edx),%eax
    3131:	83 c8 01             	or     $0x1,%eax
    3134:	50                   	push   %eax
    3135:	52                   	push   %edx
    3136:	e8 55 f2 ff ff       	call   2390 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
    313b:	e9 4e fe ff ff       	jmp    2f8e <.L564+0xfe>
    3140:	8b 87 5c 01 00 00    	mov    0x15c(%edi),%eax
    3146:	85 c0                	test   %eax,%eax
    3148:	0f 84 30 05 00 00    	je     367e <.L561+0x82>
    314e:	8b 97 2c 02 00 00    	mov    0x22c(%edi),%edx
    3154:	85 d2                	test   %edx,%edx
    3156:	0f 84 22 05 00 00    	je     367e <.L561+0x82>
    315c:	8b 9f 34 02 00 00    	mov    0x234(%edi),%ebx
    3162:	85 db                	test   %ebx,%ebx
    3164:	0f 84 f9 03 00 00    	je     3563 <.L564+0x6d3>
    316a:	8b 8f 3c 02 00 00    	mov    0x23c(%edi),%ecx
    3170:	85 c9                	test   %ecx,%ecx
    3172:	0f 84 f5 03 00 00    	je     356d <.L564+0x6dd>
    3178:	8b b7 44 02 00 00    	mov    0x244(%edi),%esi
    317e:	85 f6                	test   %esi,%esi
    3180:	0f 84 f1 03 00 00    	je     3577 <.L564+0x6e7>
    3186:	83 bf 4c 02 00 00 00 	cmpl   $0x0,0x24c(%edi)
    318d:	0f 84 ee 03 00 00    	je     3581 <.L564+0x6f1>
    3193:	83 bf 54 02 00 00 00 	cmpl   $0x0,0x254(%edi)
    319a:	0f 84 eb 03 00 00    	je     358b <.L564+0x6fb>
    31a0:	83 bf 5c 02 00 00 00 	cmpl   $0x0,0x25c(%edi)
    31a7:	0f 84 e8 03 00 00    	je     3595 <.L564+0x705>
    31ad:	83 bf 64 02 00 00 00 	cmpl   $0x0,0x264(%edi)
    31b4:	0f 84 53 04 00 00    	je     360d <.L561+0x11>
    31ba:	83 bf 6c 02 00 00 00 	cmpl   $0x0,0x26c(%edi)
    31c1:	0f 84 50 04 00 00    	je     3617 <.L561+0x1b>
    31c7:	83 bf 74 02 00 00 00 	cmpl   $0x0,0x274(%edi)
    31ce:	0f 84 4d 04 00 00    	je     3621 <.L561+0x25>
    31d4:	83 bf 7c 02 00 00 00 	cmpl   $0x0,0x27c(%edi)
    31db:	0f 84 4a 04 00 00    	je     362b <.L561+0x2f>
    31e1:	83 bf 84 02 00 00 00 	cmpl   $0x0,0x284(%edi)
    31e8:	0f 84 47 04 00 00    	je     3635 <.L561+0x39>
    31ee:	83 bf 8c 02 00 00 00 	cmpl   $0x0,0x28c(%edi)
    31f5:	0f 84 44 04 00 00    	je     363f <.L561+0x43>
    31fb:	83 bf 94 02 00 00 01 	cmpl   $0x1,0x294(%edi)
    3202:	19 d2                	sbb    %edx,%edx
    3204:	83 c2 0e             	add    $0xe,%edx
    3207:	39 c2                	cmp    %eax,%edx
    3209:	0f 82 6f 04 00 00    	jb     367e <.L561+0x82>
    320f:	8b 87 54 01 00 00    	mov    0x154(%edi),%eax
    3215:	85 c0                	test   %eax,%eax
    3217:	75 0a                	jne    3223 <.L564+0x393>
    3219:	c7 87 54 01 00 00 01 	movl   $0x1,0x154(%edi)
    3220:	00 00 00 
    3223:	e8 d8 3a 00 00       	call   6d00 <_Z15report_compilerv>
    3228:	e8 d3 3d 00 00       	call   7000 <_Z18allocate_resourcesv>
    322d:	8b b7 24 01 00 00    	mov    0x124(%edi),%esi
    3233:	83 ec 04             	sub    $0x4,%esp
    3236:	8d 9f 28 c4 ff ff    	lea    -0x3bd8(%edi),%ebx
    323c:	6a 05                	push   $0x5
    323e:	53                   	push   %ebx
    323f:	89 fb                	mov    %edi,%ebx
    3241:	89 b5 7c ff ff ff    	mov    %esi,-0x84(%ebp)
    3247:	56                   	push   %esi
    3248:	e8 93 f0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    324d:	58                   	pop    %eax
    324e:	5a                   	pop    %edx
    324f:	ff b7 58 01 00 00    	push   0x158(%edi)
    3255:	56                   	push   %esi
    3256:	e8 25 ef ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    325b:	89 04 24             	mov    %eax,(%esp)
    325e:	e8 ad ee ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    3263:	8b 8f 58 03 00 00    	mov    0x358(%edi),%ecx
    3269:	83 c4 10             	add    $0x10,%esp
    326c:	85 c9                	test   %ecx,%ecx
    326e:	0f 84 82 00 00 00    	je     32f6 <.L564+0x466>
    3274:	83 bf 2c 02 00 00 00 	cmpl   $0x0,0x22c(%edi)
    327b:	0f 84 73 04 00 00    	je     36f4 <.L561+0xf8>
    3281:	8b 97 54 03 00 00    	mov    0x354(%edi),%edx
    3287:	be 01 00 00 00       	mov    $0x1,%esi
    328c:	89 4d 80             	mov    %ecx,-0x80(%ebp)
    328f:	89 95 78 ff ff ff    	mov    %edx,-0x88(%ebp)
    3295:	ba 08 00 00 00       	mov    $0x8,%edx
    329a:	eb 1b                	jmp    32b7 <.L564+0x427>
    329c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    32a0:	46                   	inc    %esi
    32a1:	8b 9c f7 24 02 00 00 	mov    0x224(%edi,%esi,8),%ebx
    32a8:	8d 14 f5 00 00 00 00 	lea    0x0(,%esi,8),%edx
    32af:	85 db                	test   %ebx,%ebx
    32b1:	0f 84 3d 04 00 00    	je     36f4 <.L561+0xf8>
    32b7:	8b 84 3a 28 02 00 00 	mov    0x228(%edx,%edi,1),%eax
    32be:	83 ec 0c             	sub    $0xc,%esp
    32c1:	89 fb                	mov    %edi,%ebx
    32c3:	50                   	push   %eax
    32c4:	89 45 84             	mov    %eax,-0x7c(%ebp)
    32c7:	e8 84 ee ff ff       	call   2150 <strlen@plt>
    32cc:	83 c4 10             	add    $0x10,%esp
    32cf:	39 45 80             	cmp    %eax,-0x80(%ebp)
    32d2:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
    32d5:	75 c9                	jne    32a0 <.L564+0x410>
    32d7:	83 ec 04             	sub    $0x4,%esp
    32da:	ff 75 80             	push   -0x80(%ebp)
    32dd:	51                   	push   %ecx
    32de:	ff b5 78 ff ff ff    	push   -0x88(%ebp)
    32e4:	e8 37 ef ff ff       	call   2220 <memcmp@plt>
    32e9:	83 c4 10             	add    $0x10,%esp
    32ec:	85 c0                	test   %eax,%eax
    32ee:	75 b0                	jne    32a0 <.L564+0x410>
    32f0:	89 b7 5c 01 00 00    	mov    %esi,0x15c(%edi)
    32f6:	8b b5 7c ff ff ff    	mov    -0x84(%ebp),%esi
    32fc:	83 ec 04             	sub    $0x4,%esp
    32ff:	8d 8f 4b c4 ff ff    	lea    -0x3bb5(%edi),%ecx
    3305:	89 fb                	mov    %edi,%ebx
    3307:	6a 09                	push   $0x9
    3309:	51                   	push   %ecx
    330a:	56                   	push   %esi
    330b:	e8 d0 ef ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3310:	58                   	pop    %eax
    3311:	5a                   	pop    %edx
    3312:	ff b7 54 01 00 00    	push   0x154(%edi)
    3318:	56                   	push   %esi
    3319:	e8 62 ee ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    331e:	89 04 24             	mov    %eax,(%esp)
    3321:	e8 ea ed ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    3326:	83 c4 10             	add    $0x10,%esp
    3329:	80 bf 84 03 00 00 00 	cmpb   $0x0,0x384(%edi)
    3330:	0f 85 9a 03 00 00    	jne    36d0 <.L561+0xd4>
    3336:	8b b5 68 ff ff ff    	mov    -0x98(%ebp),%esi
    333c:	83 ec 0c             	sub    $0xc,%esp
    333f:	56                   	push   %esi
    3340:	e8 eb 05 00 00       	call   3930 <_ZN8CPUTimerC1Ev>
    3345:	89 34 24             	mov    %esi,(%esp)
    3348:	e8 f3 05 00 00       	call   3940 <_ZN8CPUTimer5startEv>
    334d:	8b 97 54 01 00 00    	mov    0x154(%edi),%edx
    3353:	83 c4 10             	add    $0x10,%esp
    3356:	85 d2                	test   %edx,%edx
    3358:	0f 84 fb 01 00 00    	je     3559 <.L564+0x6c9>
    335e:	bb 01 00 00 00       	mov    $0x1,%ebx
    3363:	8d b7 24 02 00 00    	lea    0x224(%edi),%esi
    3369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3370:	ff b7 58 01 00 00    	push   0x158(%edi)
    3376:	68 00 00 40 3f       	push   $0x3f400000
    337b:	ff b7 88 03 00 00    	push   0x388(%edi)
    3381:	8b 87 5c 01 00 00    	mov    0x15c(%edi),%eax
    3387:	ff b7 8c 03 00 00    	push   0x38c(%edi)
    338d:	ff 14 c6             	call   *(%esi,%eax,8)
    3390:	d9 5d 84             	fstps  -0x7c(%ebp)
    3393:	83 c4 10             	add    $0x10,%esp
    3396:	43                   	inc    %ebx
    3397:	39 9f 54 01 00 00    	cmp    %ebx,0x154(%edi)
    339d:	73 d1                	jae    3370 <.L564+0x4e0>
    339f:	83 ec 0c             	sub    $0xc,%esp
    33a2:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    33a8:	89 fb                	mov    %edi,%ebx
    33aa:	e8 c1 05 00 00       	call   3970 <_ZN8CPUTimer4stopEv>
    33af:	8b b5 7c ff ff ff    	mov    -0x84(%ebp),%esi
    33b5:	83 c4 0c             	add    $0xc,%esp
    33b8:	8d 8f 55 c4 ff ff    	lea    -0x3bab(%edi),%ecx
    33be:	6a 07                	push   $0x7
    33c0:	51                   	push   %ecx
    33c1:	56                   	push   %esi
    33c2:	e8 19 ef ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    33c7:	58                   	pop    %eax
    33c8:	5a                   	pop    %edx
    33c9:	56                   	push   %esi
    33ca:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    33d0:	e8 cb 05 00 00       	call   39a0 <_ZN8CPUTimer5printERSo>
    33d5:	89 34 24             	mov    %esi,(%esp)
    33d8:	e8 33 ed ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    33dd:	83 c4 0c             	add    $0xc,%esp
    33e0:	8d 97 5d c4 ff ff    	lea    -0x3ba3(%edi),%edx
    33e6:	6a 07                	push   $0x7
    33e8:	52                   	push   %edx
    33e9:	56                   	push   %esi
    33ea:	e8 f1 ee ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    33ef:	d9 45 84             	flds   -0x7c(%ebp)
    33f2:	89 34 24             	mov    %esi,(%esp)
    33f5:	dd 5c 24 04          	fstpl  0x4(%esp)
    33f9:	e8 62 ef ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    33fe:	89 04 24             	mov    %eax,(%esp)
    3401:	e8 0a ed ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    3406:	83 c4 0c             	add    $0xc,%esp
    3409:	8d 87 38 c2 ff ff    	lea    -0x3dc8(%edi),%eax
    340f:	6a 0c                	push   $0xc
    3411:	50                   	push   %eax
    3412:	56                   	push   %esi
    3413:	e8 c8 ee ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3418:	59                   	pop    %ecx
    3419:	8b 8f 5c 01 00 00    	mov    0x15c(%edi),%ecx
    341f:	58                   	pop    %eax
    3420:	ff b4 cf 28 02 00 00 	push   0x228(%edi,%ecx,8)
    3427:	56                   	push   %esi
    3428:	e8 33 ee ff ff       	call   2260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    342d:	89 04 24             	mov    %eax,(%esp)
    3430:	e8 db ec ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    3435:	83 c4 10             	add    $0x10,%esp
    3438:	80 bf 50 03 00 00 00 	cmpb   $0x0,0x350(%edi)
    343f:	74 6b                	je     34ac <.L564+0x61c>
    3441:	8b 9f 58 01 00 00    	mov    0x158(%edi),%ebx
    3447:	8d 75 b0             	lea    -0x50(%ebp),%esi
    344a:	8d 97 d8 c4 ff ff    	lea    -0x3b28(%edi),%edx
    3450:	89 f0                	mov    %esi,%eax
    3452:	89 5d 84             	mov    %ebx,-0x7c(%ebp)
    3455:	8b 9f 8c 03 00 00    	mov    0x38c(%edi),%ebx
    345b:	e8 b0 37 00 00       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    3460:	52                   	push   %edx
    3461:	ff 75 84             	push   -0x7c(%ebp)
    3464:	53                   	push   %ebx
    3465:	56                   	push   %esi
    3466:	e8 35 39 00 00       	call   6da0 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj>
    346b:	89 fb                	mov    %edi,%ebx
    346d:	89 34 24             	mov    %esi,(%esp)
    3470:	e8 3b ee ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    3475:	8b 97 58 01 00 00    	mov    0x158(%edi),%edx
    347b:	83 c4 10             	add    $0x10,%esp
    347e:	89 f0                	mov    %esi,%eax
    3480:	8b 9f 88 03 00 00    	mov    0x388(%edi),%ebx
    3486:	89 55 84             	mov    %edx,-0x7c(%ebp)
    3489:	8d 97 fa c1 ff ff    	lea    -0x3e06(%edi),%edx
    348f:	e8 7c 37 00 00       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    3494:	50                   	push   %eax
    3495:	ff 75 84             	push   -0x7c(%ebp)
    3498:	53                   	push   %ebx
    3499:	56                   	push   %esi
    349a:	e8 01 39 00 00       	call   6da0 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj>
    349f:	89 fb                	mov    %edi,%ebx
    34a1:	89 34 24             	mov    %esi,(%esp)
    34a4:	e8 07 ee ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    34a9:	83 c4 10             	add    $0x10,%esp
    34ac:	e8 af 41 00 00       	call   7660 <_Z14free_resourcesv>
    34b1:	83 ec 0c             	sub    $0xc,%esp
    34b4:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
    34ba:	89 fb                	mov    %edi,%ebx
    34bc:	e8 ef ed ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    34c1:	83 c4 10             	add    $0x10,%esp
    34c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34c7:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    34ce:	0f 85 a5 01 00 00    	jne    3679 <.L561+0x7d>
    34d4:	8d 65 f0             	lea    -0x10(%ebp),%esp
    34d7:	31 c0                	xor    %eax,%eax
    34d9:	59                   	pop    %ecx
    34da:	5b                   	pop    %ebx
    34db:	5e                   	pop    %esi
    34dc:	5f                   	pop    %edi
    34dd:	5d                   	pop    %ebp
    34de:	8d 61 fc             	lea    -0x4(%ecx),%esp
    34e1:	c3                   	ret
    34e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    34e9:	00 
    34ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    34f0:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
    34f6:	83 ec 08             	sub    $0x8,%esp
    34f9:	8b 02                	mov    (%edx),%eax
    34fb:	03 50 f4             	add    -0xc(%eax),%edx
    34fe:	8b 4a 14             	mov    0x14(%edx),%ecx
    3501:	83 c9 01             	or     $0x1,%ecx
    3504:	51                   	push   %ecx
    3505:	52                   	push   %edx
    3506:	e8 85 ee ff ff       	call   2390 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
    350b:	e9 cc fa ff ff       	jmp    2fdc <.L564+0x14c>
    3510:	51                   	push   %ecx
    3511:	8d 4d 94             	lea    -0x6c(%ebp),%ecx
    3514:	6a 00                	push   $0x0
    3516:	51                   	push   %ecx
    3517:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    351d:	e8 8e ee ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    3522:	8b 55 94             	mov    -0x6c(%ebp),%edx
    3525:	83 c4 10             	add    $0x10,%esp
    3528:	89 45 c8             	mov    %eax,-0x38(%ebp)
    352b:	89 55 d0             	mov    %edx,-0x30(%ebp)
    352e:	52                   	push   %edx
    352f:	56                   	push   %esi
    3530:	ff 75 84             	push   -0x7c(%ebp)
    3533:	89 fb                	mov    %edi,%ebx
    3535:	50                   	push   %eax
    3536:	e8 f5 eb ff ff       	call   2130 <memcpy@plt>
    353b:	83 c4 10             	add    $0x10,%esp
    353e:	e9 26 f7 ff ff       	jmp    2c69 <main+0x99>
    3543:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    3549:	e9 64 fb ff ff       	jmp    30b2 <.L564+0x222>
    354e:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    3554:	e9 a7 fb ff ff       	jmp    3100 <.L564+0x270>
    3559:	d9 ee                	fldz
    355b:	d9 5d 84             	fstps  -0x7c(%ebp)
    355e:	e9 3c fe ff ff       	jmp    339f <.L564+0x50f>
    3563:	ba 01 00 00 00       	mov    $0x1,%edx
    3568:	e9 9a fc ff ff       	jmp    3207 <.L564+0x377>
    356d:	ba 02 00 00 00       	mov    $0x2,%edx
    3572:	e9 90 fc ff ff       	jmp    3207 <.L564+0x377>
    3577:	ba 03 00 00 00       	mov    $0x3,%edx
    357c:	e9 86 fc ff ff       	jmp    3207 <.L564+0x377>
    3581:	ba 04 00 00 00       	mov    $0x4,%edx
    3586:	e9 7c fc ff ff       	jmp    3207 <.L564+0x377>
    358b:	ba 05 00 00 00       	mov    $0x5,%edx
    3590:	e9 72 fc ff ff       	jmp    3207 <.L564+0x377>
    3595:	ba 06 00 00 00       	mov    $0x6,%edx
    359a:	e9 68 fc ff ff       	jmp    3207 <.L564+0x377>

0000359f <.L553>:
    359f:	8d b7 7c ca ff ff    	lea    -0x3584(%edi),%esi
    35a5:	50                   	push   %eax
    35a6:	6a 26                	push   $0x26
    35a8:	89 fb                	mov    %edi,%ebx
    35aa:	56                   	push   %esi
    35ab:	8b b7 3c 01 00 00    	mov    0x13c(%edi),%esi
    35b1:	56                   	push   %esi
    35b2:	e8 29 ed ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    35b7:	89 34 24             	mov    %esi,(%esp)
    35ba:	e8 51 eb ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    35bf:	83 c4 10             	add    $0x10,%esp
    35c2:	89 fb                	mov    %edi,%ebx
    35c4:	83 ec 0c             	sub    $0xc,%esp
    35c7:	6a 01                	push   $0x1
    35c9:	e8 62 ed ff ff       	call   2330 <exit@plt>

000035ce <.L562>:
    35ce:	8b 55 80             	mov    -0x80(%ebp),%edx
    35d1:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    35d7:	8b 12                	mov    (%edx),%edx
    35d9:	e8 32 36 00 00       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    35de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35e1:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    35e8:	0f 85 8b 00 00 00    	jne    3679 <.L561+0x7d>
    35ee:	83 ec 0c             	sub    $0xc,%esp
    35f1:	ff b5 68 ff ff ff    	push   -0x98(%ebp)
    35f7:	e8 d4 48 00 00       	call   7ed0 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>

000035fc <.L561>:
    35fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35ff:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    3606:	75 71                	jne    3679 <.L561+0x7d>
    3608:	e8 13 47 00 00       	call   7d20 <_Z12list_methodsv>
    360d:	ba 07 00 00 00       	mov    $0x7,%edx
    3612:	e9 f0 fb ff ff       	jmp    3207 <.L564+0x377>
    3617:	ba 08 00 00 00       	mov    $0x8,%edx
    361c:	e9 e6 fb ff ff       	jmp    3207 <.L564+0x377>
    3621:	ba 09 00 00 00       	mov    $0x9,%edx
    3626:	e9 dc fb ff ff       	jmp    3207 <.L564+0x377>
    362b:	ba 0a 00 00 00       	mov    $0xa,%edx
    3630:	e9 d2 fb ff ff       	jmp    3207 <.L564+0x377>
    3635:	ba 0b 00 00 00       	mov    $0xb,%edx
    363a:	e9 c8 fb ff ff       	jmp    3207 <.L564+0x377>
    363f:	ba 0c 00 00 00       	mov    $0xc,%edx
    3644:	e9 be fb ff ff       	jmp    3207 <.L564+0x377>
    3649:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    364c:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    3653:	75 24                	jne    3679 <.L561+0x7d>
    3655:	83 ec 0c             	sub    $0xc,%esp
    3658:	8d 87 e0 c5 ff ff    	lea    -0x3a20(%edi),%eax
    365e:	89 fb                	mov    %edi,%ebx
    3660:	50                   	push   %eax
    3661:	e8 4a eb ff ff       	call   21b0 <_ZSt19__throw_logic_errorPKc@plt>
    3666:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3669:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    3670:	75 07                	jne    3679 <.L561+0x7d>
    3672:	89 fb                	mov    %edi,%ebx
    3674:	e8 57 ec ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    3679:	e8 22 73 00 00       	call   a9a0 <__stack_chk_fail_local>
    367e:	56                   	push   %esi
    367f:	8d b7 09 c4 ff ff    	lea    -0x3bf7(%edi),%esi
    3685:	6a 1c                	push   $0x1c
    3687:	89 fb                	mov    %edi,%ebx
    3689:	56                   	push   %esi
    368a:	8b b7 3c 01 00 00    	mov    0x13c(%edi),%esi
    3690:	56                   	push   %esi
    3691:	e8 4a ec ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3696:	83 c4 10             	add    $0x10,%esp
    3699:	ba 01 00 00 00       	mov    $0x1,%edx
    369e:	eb 01                	jmp    36a1 <.L561+0xa5>
    36a0:	42                   	inc    %edx
    36a1:	83 bc d7 24 02 00 00 	cmpl   $0x0,0x224(%edi,%edx,8)
    36a8:	00 
    36a9:	75 f5                	jne    36a0 <.L561+0xa4>
    36ab:	4a                   	dec    %edx
    36ac:	89 fb                	mov    %edi,%ebx
    36ae:	51                   	push   %ecx
    36af:	51                   	push   %ecx
    36b0:	52                   	push   %edx
    36b1:	56                   	push   %esi
    36b2:	e8 c9 ea ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    36b7:	83 c4 0c             	add    $0xc,%esp
    36ba:	89 c6                	mov    %eax,%esi
    36bc:	8d 87 26 c4 ff ff    	lea    -0x3bda(%edi),%eax
    36c2:	6a 01                	push   $0x1
    36c4:	50                   	push   %eax
    36c5:	56                   	push   %esi
    36c6:	e8 15 ec ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    36cb:	e9 e7 fe ff ff       	jmp    35b7 <.L553+0x18>
    36d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36d3:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    36da:	75 9d                	jne    3679 <.L561+0x7d>
    36dc:	53                   	push   %ebx
    36dd:	ff b7 58 01 00 00    	push   0x158(%edi)
    36e3:	ff b7 88 03 00 00    	push   0x388(%edi)
    36e9:	ff b7 8c 03 00 00    	push   0x38c(%edi)
    36ef:	e8 9c 3f 00 00       	call   7690 <_Z13validity_testPfS_j>
    36f4:	8d b7 2e c4 ff ff    	lea    -0x3bd2(%edi),%esi
    36fa:	51                   	push   %ecx
    36fb:	6a 1c                	push   $0x1c
    36fd:	89 fb                	mov    %edi,%ebx
    36ff:	56                   	push   %esi
    3700:	8b b7 3c 01 00 00    	mov    0x13c(%edi),%esi
    3706:	56                   	push   %esi
    3707:	e8 d4 eb ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    370c:	83 c4 0c             	add    $0xc,%esp
    370f:	ff b7 58 03 00 00    	push   0x358(%edi)
    3715:	ff b7 54 03 00 00    	push   0x354(%edi)
    371b:	56                   	push   %esi
    371c:	e8 bf eb ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3721:	83 c4 0c             	add    $0xc,%esp
    3724:	89 c6                	mov    %eax,%esi
    3726:	8d 87 49 c4 ff ff    	lea    -0x3bb7(%edi),%eax
    372c:	6a 01                	push   $0x1
    372e:	50                   	push   %eax
    372f:	56                   	push   %esi
    3730:	e8 ab eb ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3735:	e9 7d fe ff ff       	jmp    35b7 <.L553+0x18>
    373a:	89 c6                	mov    %eax,%esi
    373c:	e9 d0 ef ff ff       	jmp    2711 <main.cold>
    3741:	89 45 84             	mov    %eax,-0x7c(%ebp)
    3744:	e9 06 f0 ff ff       	jmp    274f <main.cold+0x3e>
    3749:	89 c6                	mov    %eax,%esi
    374b:	e9 c1 ef ff ff       	jmp    2711 <main.cold>
    3750:	89 45 84             	mov    %eax,-0x7c(%ebp)
    3753:	e9 f7 ef ff ff       	jmp    274f <main.cold+0x3e>
    3758:	89 c6                	mov    %eax,%esi
    375a:	c5 f8 77             	vzeroupper
    375d:	e9 c5 ef ff ff       	jmp    2727 <main.cold+0x16>
    3762:	89 c6                	mov    %eax,%esi
    3764:	e9 a8 ef ff ff       	jmp    2711 <main.cold>
    3769:	89 c6                	mov    %eax,%esi
    376b:	e9 a1 ef ff ff       	jmp    2711 <main.cold>

00003770 <_GLOBAL__sub_I__Z15report_compilerv>:
    3770:	57                   	push   %edi
    3771:	56                   	push   %esi
    3772:	53                   	push   %ebx
    3773:	e8 b8 00 00 00       	call   3830 <__x86.get_pc_thunk.bx>
    3778:	81 c3 44 b7 00 00    	add    $0xb744,%ebx
    377e:	8d 83 70 03 00 00    	lea    0x370(%ebx),%eax
    3784:	83 ec 04             	sub    $0x4,%esp
    3787:	8d bb 48 01 00 00    	lea    0x148(%ebx),%edi
    378d:	8d 93 24 9e ff ff    	lea    -0x61dc(%ebx),%edx
    3793:	89 83 78 03 00 00    	mov    %eax,0x378(%ebx)
    3799:	89 83 7c 03 00 00    	mov    %eax,0x37c(%ebx)
    379f:	83 e8 04             	sub    $0x4,%eax
    37a2:	57                   	push   %edi
    37a3:	8d b3 54 03 00 00    	lea    0x354(%ebx),%esi
    37a9:	50                   	push   %eax
    37aa:	52                   	push   %edx
    37ab:	c7 83 70 03 00 00 00 	movl   $0x0,0x370(%ebx)
    37b2:	00 00 00 
    37b5:	c7 83 74 03 00 00 00 	movl   $0x0,0x374(%ebx)
    37bc:	00 00 00 
    37bf:	c7 83 80 03 00 00 00 	movl   $0x0,0x380(%ebx)
    37c6:	00 00 00 
    37c9:	e8 d2 e9 ff ff       	call   21a0 <__cxa_atexit@plt>
    37ce:	8d 93 68 c2 ff ff    	lea    -0x3d98(%ebx),%edx
    37d4:	89 f0                	mov    %esi,%eax
    37d6:	83 c4 10             	add    $0x10,%esp
    37d9:	e8 32 34 00 00       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    37de:	83 ec 04             	sub    $0x4,%esp
    37e1:	57                   	push   %edi
    37e2:	56                   	push   %esi
    37e3:	ff b3 14 01 00 00    	push   0x114(%ebx)
    37e9:	e8 b2 e9 ff ff       	call   21a0 <__cxa_atexit@plt>
    37ee:	83 c4 10             	add    $0x10,%esp
    37f1:	5b                   	pop    %ebx
    37f2:	5e                   	pop    %esi
    37f3:	5f                   	pop    %edi
    37f4:	c3                   	ret
    37f5:	66 90                	xchg   %ax,%ax
    37f7:	66 90                	xchg   %ax,%ax
    37f9:	66 90                	xchg   %ax,%ax
    37fb:	66 90                	xchg   %ax,%ax
    37fd:	66 90                	xchg   %ax,%ax
    37ff:	90                   	nop

00003800 <_start>:
    3800:	31 ed                	xor    %ebp,%ebp
    3802:	5e                   	pop    %esi
    3803:	89 e1                	mov    %esp,%ecx
    3805:	83 e4 f0             	and    $0xfffffff0,%esp
    3808:	50                   	push   %eax
    3809:	54                   	push   %esp
    380a:	52                   	push   %edx
    380b:	e8 18 00 00 00       	call   3828 <_start+0x28>
    3810:	81 c3 ac b6 00 00    	add    $0xb6ac,%ebx
    3816:	6a 00                	push   $0x0
    3818:	6a 00                	push   $0x0
    381a:	51                   	push   %ecx
    381b:	56                   	push   %esi
    381c:	ff b3 10 01 00 00    	push   0x110(%ebx)
    3822:	e8 b9 e9 ff ff       	call   21e0 <__libc_start_main@plt>
    3827:	f4                   	hlt
    3828:	8b 1c 24             	mov    (%esp),%ebx
    382b:	c3                   	ret
    382c:	66 90                	xchg   %ax,%ax
    382e:	66 90                	xchg   %ax,%ax

00003830 <__x86.get_pc_thunk.bx>:
    3830:	8b 1c 24             	mov    (%esp),%ebx
    3833:	c3                   	ret
    3834:	66 90                	xchg   %ax,%ax
    3836:	66 90                	xchg   %ax,%ax
    3838:	66 90                	xchg   %ax,%ax
    383a:	66 90                	xchg   %ax,%ax
    383c:	66 90                	xchg   %ax,%ax
    383e:	66 90                	xchg   %ax,%ax

00003840 <deregister_tm_clones>:
    3840:	e8 e4 00 00 00       	call   3929 <__x86.get_pc_thunk.dx>
    3845:	81 c2 77 b6 00 00    	add    $0xb677,%edx
    384b:	8d 8a a4 02 00 00    	lea    0x2a4(%edx),%ecx
    3851:	8d 82 a4 02 00 00    	lea    0x2a4(%edx),%eax
    3857:	39 c8                	cmp    %ecx,%eax
    3859:	74 1d                	je     3878 <deregister_tm_clones+0x38>
    385b:	8b 82 2c 01 00 00    	mov    0x12c(%edx),%eax
    3861:	85 c0                	test   %eax,%eax
    3863:	74 13                	je     3878 <deregister_tm_clones+0x38>
    3865:	55                   	push   %ebp
    3866:	89 e5                	mov    %esp,%ebp
    3868:	83 ec 14             	sub    $0x14,%esp
    386b:	51                   	push   %ecx
    386c:	ff d0                	call   *%eax
    386e:	83 c4 10             	add    $0x10,%esp
    3871:	c9                   	leave
    3872:	c3                   	ret
    3873:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    3878:	c3                   	ret
    3879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003880 <register_tm_clones>:
    3880:	e8 a4 00 00 00       	call   3929 <__x86.get_pc_thunk.dx>
    3885:	81 c2 37 b6 00 00    	add    $0xb637,%edx
    388b:	55                   	push   %ebp
    388c:	89 e5                	mov    %esp,%ebp
    388e:	53                   	push   %ebx
    388f:	8d 8a a4 02 00 00    	lea    0x2a4(%edx),%ecx
    3895:	8d 82 a4 02 00 00    	lea    0x2a4(%edx),%eax
    389b:	83 ec 04             	sub    $0x4,%esp
    389e:	29 c8                	sub    %ecx,%eax
    38a0:	89 c3                	mov    %eax,%ebx
    38a2:	c1 e8 1f             	shr    $0x1f,%eax
    38a5:	c1 fb 02             	sar    $0x2,%ebx
    38a8:	01 d8                	add    %ebx,%eax
    38aa:	d1 f8                	sar    $1,%eax
    38ac:	74 14                	je     38c2 <register_tm_clones+0x42>
    38ae:	8b 92 38 01 00 00    	mov    0x138(%edx),%edx
    38b4:	85 d2                	test   %edx,%edx
    38b6:	74 0a                	je     38c2 <register_tm_clones+0x42>
    38b8:	83 ec 08             	sub    $0x8,%esp
    38bb:	50                   	push   %eax
    38bc:	51                   	push   %ecx
    38bd:	ff d2                	call   *%edx
    38bf:	83 c4 10             	add    $0x10,%esp
    38c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    38c5:	c9                   	leave
    38c6:	c3                   	ret
    38c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    38ce:	00 
    38cf:	90                   	nop

000038d0 <__do_global_dtors_aux>:
    38d0:	f3 0f 1e fb          	endbr32
    38d4:	55                   	push   %ebp
    38d5:	89 e5                	mov    %esp,%ebp
    38d7:	53                   	push   %ebx
    38d8:	e8 53 ff ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    38dd:	81 c3 df b5 00 00    	add    $0xb5df,%ebx
    38e3:	83 ec 04             	sub    $0x4,%esp
    38e6:	80 bb a4 02 00 00 00 	cmpb   $0x0,0x2a4(%ebx)
    38ed:	75 27                	jne    3916 <__do_global_dtors_aux+0x46>
    38ef:	8b 83 04 01 00 00    	mov    0x104(%ebx),%eax
    38f5:	85 c0                	test   %eax,%eax
    38f7:	74 11                	je     390a <__do_global_dtors_aux+0x3a>
    38f9:	83 ec 0c             	sub    $0xc,%esp
    38fc:	ff b3 48 01 00 00    	push   0x148(%ebx)
    3902:	e8 09 eb ff ff       	call   2410 <__cxa_finalize@plt>
    3907:	83 c4 10             	add    $0x10,%esp
    390a:	e8 31 ff ff ff       	call   3840 <deregister_tm_clones>
    390f:	c6 83 a4 02 00 00 01 	movb   $0x1,0x2a4(%ebx)
    3916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3919:	c9                   	leave
    391a:	c3                   	ret
    391b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003920 <frame_dummy>:
    3920:	f3 0f 1e fb          	endbr32
    3924:	e9 57 ff ff ff       	jmp    3880 <register_tm_clones>

00003929 <__x86.get_pc_thunk.dx>:
    3929:	8b 14 24             	mov    (%esp),%edx
    392c:	c3                   	ret
    392d:	66 90                	xchg   %ax,%ax
    392f:	90                   	nop

00003930 <_ZN8CPUTimerC1Ev>:
    3930:	8b 44 24 04          	mov    0x4(%esp),%eax
    3934:	66 c7 40 18 00 00    	movw   $0x0,0x18(%eax)
    393a:	c3                   	ret
    393b:	90                   	nop
    393c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003940 <_ZN8CPUTimer5startEv>:
    3940:	53                   	push   %ebx
    3941:	83 ec 14             	sub    $0x14,%esp
    3944:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3948:	e8 e3 fe ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    394d:	81 c3 6f b5 00 00    	add    $0xb56f,%ebx
    3953:	c6 40 18 01          	movb   $0x1,0x18(%eax)
    3957:	83 c0 08             	add    $0x8,%eax
    395a:	50                   	push   %eax
    395b:	e8 00 6b 00 00       	call   a460 <cpu_rdtsc_read>
    3960:	83 c4 18             	add    $0x18,%esp
    3963:	5b                   	pop    %ebx
    3964:	c3                   	ret
    3965:	90                   	nop
    3966:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    396d:	00 
    396e:	66 90                	xchg   %ax,%ax

00003970 <_ZN8CPUTimer4stopEv>:
    3970:	56                   	push   %esi
    3971:	53                   	push   %ebx
    3972:	83 ec 10             	sub    $0x10,%esp
    3975:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    3979:	e8 b2 fe ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    397e:	81 c3 3e b5 00 00    	add    $0xb53e,%ebx
    3984:	8d 46 10             	lea    0x10(%esi),%eax
    3987:	50                   	push   %eax
    3988:	e8 d3 6a 00 00       	call   a460 <cpu_rdtsc_read>
    398d:	c6 46 19 01          	movb   $0x1,0x19(%esi)
    3991:	83 c4 14             	add    $0x14,%esp
    3994:	5b                   	pop    %ebx
    3995:	5e                   	pop    %esi
    3996:	c3                   	ret
    3997:	90                   	nop
    3998:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    399f:	00 

000039a0 <_ZN8CPUTimer5printERSo>:
    39a0:	55                   	push   %ebp
    39a1:	89 e5                	mov    %esp,%ebp
    39a3:	57                   	push   %edi
    39a4:	56                   	push   %esi
    39a5:	53                   	push   %ebx
    39a6:	83 ec 1c             	sub    $0x1c,%esp
    39a9:	8b 75 08             	mov    0x8(%ebp),%esi
    39ac:	e8 81 00 00 00       	call   3a32 <__x86.get_pc_thunk.di>
    39b1:	81 c7 0b b5 00 00    	add    $0xb50b,%edi
    39b7:	80 7e 18 00          	cmpb   $0x0,0x18(%esi)
    39bb:	0f 84 5f ea ff ff    	je     2420 <_ZN8CPUTimer5printERSo.cold>
    39c1:	80 7e 19 00          	cmpb   $0x0,0x19(%esi)
    39c5:	0f 84 87 ea ff ff    	je     2452 <_ZN8CPUTimer5printERSo.cold+0x32>
    39cb:	31 c0                	xor    %eax,%eax
    39cd:	2b 46 08             	sub    0x8(%esi),%eax
    39d0:	8b 56 14             	mov    0x14(%esi),%edx
    39d3:	8b 4e 10             	mov    0x10(%esi),%ecx
    39d6:	c5 f9 6e c0          	vmovd  %eax,%xmm0
    39da:	8b 46 0c             	mov    0xc(%esi),%eax
    39dd:	83 da 00             	sbb    $0x0,%edx
    39e0:	c5 f9 6e c9          	vmovd  %ecx,%xmm1
    39e4:	c4 e3 79 22 da 01    	vpinsrd $0x1,%edx,%xmm0,%xmm3
    39ea:	31 db                	xor    %ebx,%ebx
    39ec:	31 d2                	xor    %edx,%edx
    39ee:	83 ec 0c             	sub    $0xc,%esp
    39f1:	c4 e3 71 22 e3 01    	vpinsrd $0x1,%ebx,%xmm1,%xmm4
    39f7:	89 fb                	mov    %edi,%ebx
    39f9:	c5 f9 6e d0          	vmovd  %eax,%xmm2
    39fd:	c4 e3 69 22 ea 01    	vpinsrd $0x1,%edx,%xmm2,%xmm5
    3a03:	c5 c9 73 f5 20       	vpsllq $0x20,%xmm5,%xmm6
    3a08:	c5 d9 fb fe          	vpsubq %xmm6,%xmm4,%xmm7
    3a0c:	c5 e1 d4 c7          	vpaddq %xmm7,%xmm3,%xmm0
    3a10:	c5 f9 d6 06          	vmovq  %xmm0,(%esi)
    3a14:	c5 f9 d6 04 24       	vmovq  %xmm0,(%esp)
    3a19:	ff 75 0c             	push   0xc(%ebp)
    3a1c:	e8 4f e7 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    3a21:	66 c7 46 18 00 00    	movw   $0x0,0x18(%esi)
    3a27:	83 c4 10             	add    $0x10,%esp
    3a2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a2d:	5b                   	pop    %ebx
    3a2e:	5e                   	pop    %esi
    3a2f:	5f                   	pop    %edi
    3a30:	5d                   	pop    %ebp
    3a31:	c3                   	ret

00003a32 <__x86.get_pc_thunk.di>:
    3a32:	8b 3c 24             	mov    (%esp),%edi
    3a35:	c3                   	ret
    3a36:	66 90                	xchg   %ax,%ax
    3a38:	66 90                	xchg   %ax,%ax
    3a3a:	66 90                	xchg   %ax,%ax
    3a3c:	66 90                	xchg   %ax,%ax
    3a3e:	66 90                	xchg   %ax,%ax

00003a40 <_ZN2ez2ii8split_asENS0_11IntegerTypeE>:
    3a40:	e8 98 1f 00 00       	call   59dd <__x86.get_pc_thunk.ax>
    3a45:	05 77 b4 00 00       	add    $0xb477,%eax
    3a4a:	8b 54 24 04          	mov    0x4(%esp),%edx
    3a4e:	89 90 50 01 00 00    	mov    %edx,0x150(%eax)
    3a54:	c3                   	ret
    3a55:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3a5c:	00 
    3a5d:	8d 76 00             	lea    0x0(%esi),%esi

00003a60 <_ZN2ez2ii16print_i128_u16x8ERSoDv2_x>:
    3a60:	55                   	push   %ebp
    3a61:	57                   	push   %edi
    3a62:	56                   	push   %esi
    3a63:	53                   	push   %ebx
    3a64:	e8 c7 fd ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3a69:	81 c3 53 b4 00 00    	add    $0xb453,%ebx
    3a6f:	83 ec 2c             	sub    $0x2c,%esp
    3a72:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    3a78:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3a7e:	8d 44 24 10          	lea    0x10(%esp),%eax
    3a82:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%esp)
    3a88:	8d 74 24 1f          	lea    0x1f(%esp),%esi
    3a8c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3a90:	8b 55 00             	mov    0x0(%ebp),%edx
    3a93:	0f b6 06             	movzbl (%esi),%eax
    3a96:	83 ec 08             	sub    $0x8,%esp
    3a99:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3a9c:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    3aa3:	00 
    3aa4:	50                   	push   %eax
    3aa5:	55                   	push   %ebp
    3aa6:	e8 15 e9 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3aab:	83 c4 0c             	add    $0xc,%esp
    3aae:	6a 03                	push   $0x3
    3ab0:	57                   	push   %edi
    3ab1:	50                   	push   %eax
    3ab2:	e8 29 e8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3ab7:	58                   	pop    %eax
    3ab8:	5a                   	pop    %edx
    3ab9:	8b 55 00             	mov    0x0(%ebp),%edx
    3abc:	0f b6 46 ff          	movzbl -0x1(%esi),%eax
    3ac0:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3ac3:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    3aca:	00 
    3acb:	50                   	push   %eax
    3acc:	55                   	push   %ebp
    3acd:	e8 ee e8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3ad2:	83 c4 0c             	add    $0xc,%esp
    3ad5:	6a 03                	push   $0x3
    3ad7:	57                   	push   %edi
    3ad8:	50                   	push   %eax
    3ad9:	e8 02 e8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3ade:	8b 55 00             	mov    0x0(%ebp),%edx
    3ae1:	59                   	pop    %ecx
    3ae2:	58                   	pop    %eax
    3ae3:	0f b6 46 fe          	movzbl -0x2(%esi),%eax
    3ae7:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3aea:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    3af1:	00 
    3af2:	50                   	push   %eax
    3af3:	55                   	push   %ebp
    3af4:	e8 c7 e8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3af9:	83 c4 0c             	add    $0xc,%esp
    3afc:	6a 03                	push   $0x3
    3afe:	57                   	push   %edi
    3aff:	50                   	push   %eax
    3b00:	e8 db e7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3b05:	8b 4d 00             	mov    0x0(%ebp),%ecx
    3b08:	8d 56 fd             	lea    -0x3(%esi),%edx
    3b0b:	83 ee 04             	sub    $0x4,%esi
    3b0e:	89 54 24 18          	mov    %edx,0x18(%esp)
    3b12:	58                   	pop    %eax
    3b13:	5a                   	pop    %edx
    3b14:	0f b6 56 01          	movzbl 0x1(%esi),%edx
    3b18:	8b 41 f4             	mov    -0xc(%ecx),%eax
    3b1b:	c7 44 05 08 03 00 00 	movl   $0x3,0x8(%ebp,%eax,1)
    3b22:	00 
    3b23:	52                   	push   %edx
    3b24:	55                   	push   %ebp
    3b25:	e8 96 e8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3b2a:	83 c4 0c             	add    $0xc,%esp
    3b2d:	6a 03                	push   $0x3
    3b2f:	57                   	push   %edi
    3b30:	50                   	push   %eax
    3b31:	e8 aa e7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3b36:	83 c4 10             	add    $0x10,%esp
    3b39:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3b3d:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
    3b41:	0f 85 49 ff ff ff    	jne    3a90 <_ZN2ez2ii16print_i128_u16x8ERSoDv2_x+0x30>
    3b47:	83 c4 2c             	add    $0x2c,%esp
    3b4a:	5b                   	pop    %ebx
    3b4b:	5e                   	pop    %esi
    3b4c:	5f                   	pop    %edi
    3b4d:	5d                   	pop    %ebp
    3b4e:	c3                   	ret
    3b4f:	90                   	nop

00003b50 <_ZN2ez2ii16print_i128_u8x16ERSoDv2_x>:
    3b50:	55                   	push   %ebp
    3b51:	57                   	push   %edi
    3b52:	56                   	push   %esi
    3b53:	53                   	push   %ebx
    3b54:	e8 d7 fc ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3b59:	81 c3 63 b3 00 00    	add    $0xb363,%ebx
    3b5f:	83 ec 2c             	sub    $0x2c,%esp
    3b62:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    3b68:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3b6e:	8d 44 24 10          	lea    0x10(%esp),%eax
    3b72:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%esp)
    3b78:	8d 74 24 1e          	lea    0x1e(%esp),%esi
    3b7c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b80:	8b 55 00             	mov    0x0(%ebp),%edx
    3b83:	0f b7 06             	movzwl (%esi),%eax
    3b86:	83 ec 08             	sub    $0x8,%esp
    3b89:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3b8c:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    3b93:	00 
    3b94:	50                   	push   %eax
    3b95:	55                   	push   %ebp
    3b96:	e8 e5 e5 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    3b9b:	83 c4 0c             	add    $0xc,%esp
    3b9e:	6a 03                	push   $0x3
    3ba0:	57                   	push   %edi
    3ba1:	50                   	push   %eax
    3ba2:	e8 39 e7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3ba7:	58                   	pop    %eax
    3ba8:	5a                   	pop    %edx
    3ba9:	8b 55 00             	mov    0x0(%ebp),%edx
    3bac:	0f b7 46 fe          	movzwl -0x2(%esi),%eax
    3bb0:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3bb3:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    3bba:	00 
    3bbb:	50                   	push   %eax
    3bbc:	55                   	push   %ebp
    3bbd:	e8 be e5 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    3bc2:	83 c4 0c             	add    $0xc,%esp
    3bc5:	6a 03                	push   $0x3
    3bc7:	57                   	push   %edi
    3bc8:	50                   	push   %eax
    3bc9:	e8 12 e7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3bce:	8b 55 00             	mov    0x0(%ebp),%edx
    3bd1:	59                   	pop    %ecx
    3bd2:	58                   	pop    %eax
    3bd3:	0f b7 46 fc          	movzwl -0x4(%esi),%eax
    3bd7:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3bda:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    3be1:	00 
    3be2:	50                   	push   %eax
    3be3:	55                   	push   %ebp
    3be4:	e8 97 e5 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    3be9:	83 c4 0c             	add    $0xc,%esp
    3bec:	6a 03                	push   $0x3
    3bee:	57                   	push   %edi
    3bef:	50                   	push   %eax
    3bf0:	e8 eb e6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3bf5:	8b 4d 00             	mov    0x0(%ebp),%ecx
    3bf8:	8d 56 fa             	lea    -0x6(%esi),%edx
    3bfb:	83 ee 08             	sub    $0x8,%esi
    3bfe:	89 54 24 18          	mov    %edx,0x18(%esp)
    3c02:	58                   	pop    %eax
    3c03:	5a                   	pop    %edx
    3c04:	0f b7 56 02          	movzwl 0x2(%esi),%edx
    3c08:	8b 41 f4             	mov    -0xc(%ecx),%eax
    3c0b:	c7 44 05 08 06 00 00 	movl   $0x6,0x8(%ebp,%eax,1)
    3c12:	00 
    3c13:	52                   	push   %edx
    3c14:	55                   	push   %ebp
    3c15:	e8 66 e5 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    3c1a:	83 c4 0c             	add    $0xc,%esp
    3c1d:	6a 03                	push   $0x3
    3c1f:	57                   	push   %edi
    3c20:	50                   	push   %eax
    3c21:	e8 ba e6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3c26:	83 c4 10             	add    $0x10,%esp
    3c29:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3c2d:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
    3c31:	0f 85 49 ff ff ff    	jne    3b80 <_ZN2ez2ii16print_i128_u8x16ERSoDv2_x+0x30>
    3c37:	83 c4 2c             	add    $0x2c,%esp
    3c3a:	5b                   	pop    %ebx
    3c3b:	5e                   	pop    %esi
    3c3c:	5f                   	pop    %edi
    3c3d:	5d                   	pop    %ebp
    3c3e:	c3                   	ret
    3c3f:	90                   	nop

00003c40 <_ZN2ez2ii16print_i128_u4x32ERSoDv2_x>:
    3c40:	55                   	push   %ebp
    3c41:	57                   	push   %edi
    3c42:	56                   	push   %esi
    3c43:	53                   	push   %ebx
    3c44:	e8 e7 fb ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3c49:	81 c3 73 b2 00 00    	add    $0xb273,%ebx
    3c4f:	83 ec 2c             	sub    $0x2c,%esp
    3c52:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    3c58:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3c5e:	89 e0                	mov    %esp,%eax
    3c60:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%esp)
    3c66:	8d 74 24 10          	lea    0x10(%esp),%esi
    3c6a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3c6e:	8b 55 00             	mov    0x0(%ebp),%edx
    3c71:	83 ec 08             	sub    $0x8,%esp
    3c74:	83 ee 04             	sub    $0x4,%esi
    3c77:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3c7a:	c7 44 0d 08 0a 00 00 	movl   $0xa,0x8(%ebp,%ecx,1)
    3c81:	00 
    3c82:	ff 76 10             	push   0x10(%esi)
    3c85:	55                   	push   %ebp
    3c86:	e8 f5 e4 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    3c8b:	83 c4 0c             	add    $0xc,%esp
    3c8e:	6a 03                	push   $0x3
    3c90:	57                   	push   %edi
    3c91:	50                   	push   %eax
    3c92:	e8 49 e6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3c97:	83 c4 10             	add    $0x10,%esp
    3c9a:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    3c9e:	75 ce                	jne    3c6e <_ZN2ez2ii16print_i128_u4x32ERSoDv2_x+0x2e>
    3ca0:	83 c4 2c             	add    $0x2c,%esp
    3ca3:	5b                   	pop    %ebx
    3ca4:	5e                   	pop    %esi
    3ca5:	5f                   	pop    %edi
    3ca6:	5d                   	pop    %ebp
    3ca7:	c3                   	ret
    3ca8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3caf:	00 

00003cb0 <_ZN2ez2ii16print_i128_u2x64ERSoDv2_x>:
    3cb0:	57                   	push   %edi
    3cb1:	56                   	push   %esi
    3cb2:	53                   	push   %ebx
    3cb3:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
    3cb8:	e8 73 fb ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3cbd:	81 c3 ff b1 00 00    	add    $0xb1ff,%ebx
    3cc3:	83 ec 24             	sub    $0x24,%esp
    3cc6:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    3ccc:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3cd2:	c5 f9 7f 4c 24 04    	vmovdqa %xmm1,0x4(%esp)
    3cd8:	c5 f9 7f 44 24 14    	vmovdqa %xmm0,0x14(%esp)
    3cde:	8b 06                	mov    (%esi),%eax
    3ce0:	8b 50 f4             	mov    -0xc(%eax),%edx
    3ce3:	c7 44 32 08 0a 00 00 	movl   $0xa,0x8(%edx,%esi,1)
    3cea:	00 
    3ceb:	ff 74 24 08          	push   0x8(%esp)
    3cef:	ff 74 24 08          	push   0x8(%esp)
    3cf3:	56                   	push   %esi
    3cf4:	e8 77 e4 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    3cf9:	83 c4 0c             	add    $0xc,%esp
    3cfc:	6a 03                	push   $0x3
    3cfe:	57                   	push   %edi
    3cff:	50                   	push   %eax
    3d00:	e8 db e5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3d05:	8b 0e                	mov    (%esi),%ecx
    3d07:	c5 f9 6f 44 24 20    	vmovdqa 0x20(%esp),%xmm0
    3d0d:	83 c4 0c             	add    $0xc,%esp
    3d10:	8b 41 f4             	mov    -0xc(%ecx),%eax
    3d13:	c5 f9 7f 44 24 04    	vmovdqa %xmm0,0x4(%esp)
    3d19:	c7 44 30 08 0a 00 00 	movl   $0xa,0x8(%eax,%esi,1)
    3d20:	00 
    3d21:	ff 74 24 08          	push   0x8(%esp)
    3d25:	ff 74 24 08          	push   0x8(%esp)
    3d29:	56                   	push   %esi
    3d2a:	e8 41 e4 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    3d2f:	83 c4 0c             	add    $0xc,%esp
    3d32:	6a 03                	push   $0x3
    3d34:	57                   	push   %edi
    3d35:	50                   	push   %eax
    3d36:	e8 a5 e5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3d3b:	83 c4 30             	add    $0x30,%esp
    3d3e:	5b                   	pop    %ebx
    3d3f:	5e                   	pop    %esi
    3d40:	5f                   	pop    %edi
    3d41:	c3                   	ret
    3d42:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3d49:	00 
    3d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003d50 <_ZN2ez2ii16print_i128_i16x8ERSoDv2_x>:
    3d50:	55                   	push   %ebp
    3d51:	57                   	push   %edi
    3d52:	56                   	push   %esi
    3d53:	53                   	push   %ebx
    3d54:	e8 d7 fa ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3d59:	81 c3 63 b1 00 00    	add    $0xb163,%ebx
    3d5f:	83 ec 2c             	sub    $0x2c,%esp
    3d62:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    3d68:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3d6e:	8d 44 24 10          	lea    0x10(%esp),%eax
    3d72:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%esp)
    3d78:	8d 74 24 1f          	lea    0x1f(%esp),%esi
    3d7c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3d80:	8b 55 00             	mov    0x0(%ebp),%edx
    3d83:	0f be 06             	movsbl (%esi),%eax
    3d86:	83 ec 08             	sub    $0x8,%esp
    3d89:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3d8c:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    3d93:	00 
    3d94:	50                   	push   %eax
    3d95:	55                   	push   %ebp
    3d96:	e8 25 e6 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3d9b:	83 c4 0c             	add    $0xc,%esp
    3d9e:	6a 03                	push   $0x3
    3da0:	57                   	push   %edi
    3da1:	50                   	push   %eax
    3da2:	e8 39 e5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3da7:	58                   	pop    %eax
    3da8:	5a                   	pop    %edx
    3da9:	8b 55 00             	mov    0x0(%ebp),%edx
    3dac:	0f be 46 ff          	movsbl -0x1(%esi),%eax
    3db0:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3db3:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    3dba:	00 
    3dbb:	50                   	push   %eax
    3dbc:	55                   	push   %ebp
    3dbd:	e8 fe e5 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3dc2:	83 c4 0c             	add    $0xc,%esp
    3dc5:	6a 03                	push   $0x3
    3dc7:	57                   	push   %edi
    3dc8:	50                   	push   %eax
    3dc9:	e8 12 e5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3dce:	8b 55 00             	mov    0x0(%ebp),%edx
    3dd1:	59                   	pop    %ecx
    3dd2:	58                   	pop    %eax
    3dd3:	0f be 46 fe          	movsbl -0x2(%esi),%eax
    3dd7:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3dda:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    3de1:	00 
    3de2:	50                   	push   %eax
    3de3:	55                   	push   %ebp
    3de4:	e8 d7 e5 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3de9:	83 c4 0c             	add    $0xc,%esp
    3dec:	6a 03                	push   $0x3
    3dee:	57                   	push   %edi
    3def:	50                   	push   %eax
    3df0:	e8 eb e4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3df5:	8b 4d 00             	mov    0x0(%ebp),%ecx
    3df8:	8d 56 fd             	lea    -0x3(%esi),%edx
    3dfb:	83 ee 04             	sub    $0x4,%esi
    3dfe:	89 54 24 18          	mov    %edx,0x18(%esp)
    3e02:	58                   	pop    %eax
    3e03:	5a                   	pop    %edx
    3e04:	0f be 56 01          	movsbl 0x1(%esi),%edx
    3e08:	8b 41 f4             	mov    -0xc(%ecx),%eax
    3e0b:	c7 44 05 08 03 00 00 	movl   $0x3,0x8(%ebp,%eax,1)
    3e12:	00 
    3e13:	52                   	push   %edx
    3e14:	55                   	push   %ebp
    3e15:	e8 a6 e5 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3e1a:	83 c4 0c             	add    $0xc,%esp
    3e1d:	6a 03                	push   $0x3
    3e1f:	57                   	push   %edi
    3e20:	50                   	push   %eax
    3e21:	e8 ba e4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3e26:	83 c4 10             	add    $0x10,%esp
    3e29:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3e2d:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
    3e31:	0f 85 49 ff ff ff    	jne    3d80 <_ZN2ez2ii16print_i128_i16x8ERSoDv2_x+0x30>
    3e37:	83 c4 2c             	add    $0x2c,%esp
    3e3a:	5b                   	pop    %ebx
    3e3b:	5e                   	pop    %esi
    3e3c:	5f                   	pop    %edi
    3e3d:	5d                   	pop    %ebp
    3e3e:	c3                   	ret
    3e3f:	90                   	nop

00003e40 <_ZN2ez2ii16print_i128_i8x16ERSoDv2_x>:
    3e40:	55                   	push   %ebp
    3e41:	57                   	push   %edi
    3e42:	56                   	push   %esi
    3e43:	53                   	push   %ebx
    3e44:	e8 e7 f9 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3e49:	81 c3 73 b0 00 00    	add    $0xb073,%ebx
    3e4f:	83 ec 2c             	sub    $0x2c,%esp
    3e52:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    3e58:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3e5e:	8d 44 24 10          	lea    0x10(%esp),%eax
    3e62:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%esp)
    3e68:	8d 74 24 1e          	lea    0x1e(%esp),%esi
    3e6c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3e70:	8b 55 00             	mov    0x0(%ebp),%edx
    3e73:	0f bf 06             	movswl (%esi),%eax
    3e76:	83 ec 08             	sub    $0x8,%esp
    3e79:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3e7c:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    3e83:	00 
    3e84:	50                   	push   %eax
    3e85:	55                   	push   %ebp
    3e86:	e8 b5 e3 ff ff       	call   2240 <_ZNSolsEs@plt>
    3e8b:	83 c4 0c             	add    $0xc,%esp
    3e8e:	6a 03                	push   $0x3
    3e90:	57                   	push   %edi
    3e91:	50                   	push   %eax
    3e92:	e8 49 e4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3e97:	58                   	pop    %eax
    3e98:	5a                   	pop    %edx
    3e99:	8b 55 00             	mov    0x0(%ebp),%edx
    3e9c:	0f bf 46 fe          	movswl -0x2(%esi),%eax
    3ea0:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3ea3:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    3eaa:	00 
    3eab:	50                   	push   %eax
    3eac:	55                   	push   %ebp
    3ead:	e8 8e e3 ff ff       	call   2240 <_ZNSolsEs@plt>
    3eb2:	83 c4 0c             	add    $0xc,%esp
    3eb5:	6a 03                	push   $0x3
    3eb7:	57                   	push   %edi
    3eb8:	50                   	push   %eax
    3eb9:	e8 22 e4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3ebe:	8b 55 00             	mov    0x0(%ebp),%edx
    3ec1:	59                   	pop    %ecx
    3ec2:	58                   	pop    %eax
    3ec3:	0f bf 46 fc          	movswl -0x4(%esi),%eax
    3ec7:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3eca:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    3ed1:	00 
    3ed2:	50                   	push   %eax
    3ed3:	55                   	push   %ebp
    3ed4:	e8 67 e3 ff ff       	call   2240 <_ZNSolsEs@plt>
    3ed9:	83 c4 0c             	add    $0xc,%esp
    3edc:	6a 03                	push   $0x3
    3ede:	57                   	push   %edi
    3edf:	50                   	push   %eax
    3ee0:	e8 fb e3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3ee5:	8b 4d 00             	mov    0x0(%ebp),%ecx
    3ee8:	8d 56 fa             	lea    -0x6(%esi),%edx
    3eeb:	83 ee 08             	sub    $0x8,%esi
    3eee:	89 54 24 18          	mov    %edx,0x18(%esp)
    3ef2:	58                   	pop    %eax
    3ef3:	5a                   	pop    %edx
    3ef4:	0f bf 56 02          	movswl 0x2(%esi),%edx
    3ef8:	8b 41 f4             	mov    -0xc(%ecx),%eax
    3efb:	c7 44 05 08 06 00 00 	movl   $0x6,0x8(%ebp,%eax,1)
    3f02:	00 
    3f03:	52                   	push   %edx
    3f04:	55                   	push   %ebp
    3f05:	e8 36 e3 ff ff       	call   2240 <_ZNSolsEs@plt>
    3f0a:	83 c4 0c             	add    $0xc,%esp
    3f0d:	6a 03                	push   $0x3
    3f0f:	57                   	push   %edi
    3f10:	50                   	push   %eax
    3f11:	e8 ca e3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3f16:	83 c4 10             	add    $0x10,%esp
    3f19:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3f1d:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
    3f21:	0f 85 49 ff ff ff    	jne    3e70 <_ZN2ez2ii16print_i128_i8x16ERSoDv2_x+0x30>
    3f27:	83 c4 2c             	add    $0x2c,%esp
    3f2a:	5b                   	pop    %ebx
    3f2b:	5e                   	pop    %esi
    3f2c:	5f                   	pop    %edi
    3f2d:	5d                   	pop    %ebp
    3f2e:	c3                   	ret
    3f2f:	90                   	nop

00003f30 <_ZN2ez2ii16print_i128_i4x32ERSoDv2_x>:
    3f30:	55                   	push   %ebp
    3f31:	57                   	push   %edi
    3f32:	56                   	push   %esi
    3f33:	53                   	push   %ebx
    3f34:	e8 f7 f8 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3f39:	81 c3 83 af 00 00    	add    $0xaf83,%ebx
    3f3f:	83 ec 2c             	sub    $0x2c,%esp
    3f42:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    3f48:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3f4e:	89 e0                	mov    %esp,%eax
    3f50:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%esp)
    3f56:	8d 74 24 10          	lea    0x10(%esp),%esi
    3f5a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3f5e:	8b 55 00             	mov    0x0(%ebp),%edx
    3f61:	83 ec 08             	sub    $0x8,%esp
    3f64:	83 ee 04             	sub    $0x4,%esi
    3f67:	8b 4a f4             	mov    -0xc(%edx),%ecx
    3f6a:	c7 44 0d 08 0a 00 00 	movl   $0xa,0x8(%ebp,%ecx,1)
    3f71:	00 
    3f72:	ff 76 10             	push   0x10(%esi)
    3f75:	55                   	push   %ebp
    3f76:	e8 45 e4 ff ff       	call   23c0 <_ZNSolsEi@plt>
    3f7b:	83 c4 0c             	add    $0xc,%esp
    3f7e:	6a 03                	push   $0x3
    3f80:	57                   	push   %edi
    3f81:	50                   	push   %eax
    3f82:	e8 59 e3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3f87:	83 c4 10             	add    $0x10,%esp
    3f8a:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    3f8e:	75 ce                	jne    3f5e <_ZN2ez2ii16print_i128_i4x32ERSoDv2_x+0x2e>
    3f90:	83 c4 2c             	add    $0x2c,%esp
    3f93:	5b                   	pop    %ebx
    3f94:	5e                   	pop    %esi
    3f95:	5f                   	pop    %edi
    3f96:	5d                   	pop    %ebp
    3f97:	c3                   	ret
    3f98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3f9f:	00 

00003fa0 <_ZN2ez2ii16print_i128_i2x64ERSoDv2_x>:
    3fa0:	57                   	push   %edi
    3fa1:	56                   	push   %esi
    3fa2:	53                   	push   %ebx
    3fa3:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
    3fa8:	e8 83 f8 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    3fad:	81 c3 0f af 00 00    	add    $0xaf0f,%ebx
    3fb3:	83 ec 24             	sub    $0x24,%esp
    3fb6:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    3fbc:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    3fc2:	c5 f9 7f 4c 24 04    	vmovdqa %xmm1,0x4(%esp)
    3fc8:	c5 f9 7f 44 24 14    	vmovdqa %xmm0,0x14(%esp)
    3fce:	8b 06                	mov    (%esi),%eax
    3fd0:	8b 50 f4             	mov    -0xc(%eax),%edx
    3fd3:	c7 44 32 08 0a 00 00 	movl   $0xa,0x8(%edx,%esi,1)
    3fda:	00 
    3fdb:	ff 74 24 08          	push   0x8(%esp)
    3fdf:	ff 74 24 08          	push   0x8(%esp)
    3fe3:	56                   	push   %esi
    3fe4:	e8 e7 e0 ff ff       	call   20d0 <_ZNSo9_M_insertIxEERSoT_@plt>
    3fe9:	83 c4 0c             	add    $0xc,%esp
    3fec:	6a 03                	push   $0x3
    3fee:	57                   	push   %edi
    3fef:	50                   	push   %eax
    3ff0:	e8 eb e2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    3ff5:	8b 0e                	mov    (%esi),%ecx
    3ff7:	c5 f9 6f 44 24 20    	vmovdqa 0x20(%esp),%xmm0
    3ffd:	83 c4 0c             	add    $0xc,%esp
    4000:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4003:	c5 f9 7f 44 24 04    	vmovdqa %xmm0,0x4(%esp)
    4009:	c7 44 30 08 0a 00 00 	movl   $0xa,0x8(%eax,%esi,1)
    4010:	00 
    4011:	ff 74 24 08          	push   0x8(%esp)
    4015:	ff 74 24 08          	push   0x8(%esp)
    4019:	56                   	push   %esi
    401a:	e8 b1 e0 ff ff       	call   20d0 <_ZNSo9_M_insertIxEERSoT_@plt>
    401f:	83 c4 0c             	add    $0xc,%esp
    4022:	6a 03                	push   $0x3
    4024:	57                   	push   %edi
    4025:	50                   	push   %eax
    4026:	e8 b5 e2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    402b:	83 c4 30             	add    $0x30,%esp
    402e:	5b                   	pop    %ebx
    402f:	5e                   	pop    %esi
    4030:	5f                   	pop    %edi
    4031:	c3                   	ret
    4032:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    4039:	00 
    403a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00004040 <_ZN2ez2ii10print_i128ERSoDv2_x>:
    4040:	55                   	push   %ebp
    4041:	57                   	push   %edi
    4042:	56                   	push   %esi
    4043:	53                   	push   %ebx
    4044:	e8 e7 f7 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4049:	81 c3 73 ae 00 00    	add    $0xae73,%ebx
    404f:	83 ec 4c             	sub    $0x4c,%esp
    4052:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    4058:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    405c:	8b 83 50 01 00 00    	mov    0x150(%ebx),%eax
    4062:	83 c0 04             	add    $0x4,%eax
    4065:	83 f8 08             	cmp    $0x8,%eax
    4068:	0f 87 92 00 00 00    	ja     4100 <.L43>
    406e:	8b 84 83 98 c5 ff ff 	mov    -0x3a68(%ebx,%eax,4),%eax
    4075:	01 d8                	add    %ebx,%eax
    4077:	ff e0                	jmp    *%eax
    4079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004080 <.L45>:
    4080:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    4086:	83 ec 04             	sub    $0x4,%esp
    4089:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
    408e:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    4094:	c5 f9 7f 44 24 14    	vmovdqa %xmm0,0x14(%esp)
    409a:	c5 f9 7f 4c 24 04    	vmovdqa %xmm1,0x4(%esp)
    40a0:	8b 16                	mov    (%esi),%edx
    40a2:	8b 4a f4             	mov    -0xc(%edx),%ecx
    40a5:	c7 44 31 08 0a 00 00 	movl   $0xa,0x8(%ecx,%esi,1)
    40ac:	00 
    40ad:	ff 74 24 08          	push   0x8(%esp)
    40b1:	ff 74 24 08          	push   0x8(%esp)
    40b5:	56                   	push   %esi
    40b6:	e8 b5 e0 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    40bb:	83 c4 0c             	add    $0xc,%esp
    40be:	6a 03                	push   $0x3
    40c0:	57                   	push   %edi
    40c1:	50                   	push   %eax
    40c2:	e8 19 e2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    40c7:	8b 2e                	mov    (%esi),%ebp
    40c9:	c5 f9 6f 44 24 20    	vmovdqa 0x20(%esp),%xmm0
    40cf:	83 c4 0c             	add    $0xc,%esp
    40d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40d5:	c5 f9 7f 44 24 04    	vmovdqa %xmm0,0x4(%esp)
    40db:	c7 44 30 08 0a 00 00 	movl   $0xa,0x8(%eax,%esi,1)
    40e2:	00 
    40e3:	ff 74 24 08          	push   0x8(%esp)
    40e7:	ff 74 24 08          	push   0x8(%esp)
    40eb:	56                   	push   %esi
    40ec:	e8 7f e0 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    40f1:	83 c4 0c             	add    $0xc,%esp
    40f4:	6a 03                	push   $0x3
    40f6:	57                   	push   %edi
    40f7:	50                   	push   %eax
    40f8:	e8 e3 e1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    40fd:	83 c4 10             	add    $0x10,%esp

00004100 <.L43>:
    4100:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    4104:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    410b:	0f 85 ab 04 00 00    	jne    45bc <.L47+0x4c>
    4111:	83 c4 4c             	add    $0x4c,%esp
    4114:	5b                   	pop    %ebx
    4115:	5e                   	pop    %esi
    4116:	5f                   	pop    %edi
    4117:	5d                   	pop    %ebp
    4118:	c3                   	ret
    4119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004120 <.L53>:
    4120:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    4126:	83 ec 04             	sub    $0x4,%esp
    4129:	c5 e9 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm2
    412e:	c5 f9 7f 44 24 14    	vmovdqa %xmm0,0x14(%esp)
    4134:	c5 f9 7f 54 24 04    	vmovdqa %xmm2,0x4(%esp)
    413a:	8b 4d 00             	mov    0x0(%ebp),%ecx
    413d:	8b 79 f4             	mov    -0xc(%ecx),%edi
    4140:	c7 44 2f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ebp,1)
    4147:	00 
    4148:	ff 74 24 08          	push   0x8(%esp)
    414c:	ff 74 24 08          	push   0x8(%esp)
    4150:	55                   	push   %ebp
    4151:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    4157:	e8 74 df ff ff       	call   20d0 <_ZNSo9_M_insertIxEERSoT_@plt>
    415c:	83 c4 0c             	add    $0xc,%esp
    415f:	6a 03                	push   $0x3
    4161:	57                   	push   %edi
    4162:	50                   	push   %eax
    4163:	e8 78 e1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4168:	8b 75 00             	mov    0x0(%ebp),%esi
    416b:	c5 f9 6f 5c 24 20    	vmovdqa 0x20(%esp),%xmm3
    4171:	83 c4 0c             	add    $0xc,%esp
    4174:	8b 46 f4             	mov    -0xc(%esi),%eax
    4177:	c5 f9 7f 5c 24 04    	vmovdqa %xmm3,0x4(%esp)
    417d:	c7 44 28 08 0a 00 00 	movl   $0xa,0x8(%eax,%ebp,1)
    4184:	00 
    4185:	ff 74 24 08          	push   0x8(%esp)
    4189:	ff 74 24 08          	push   0x8(%esp)
    418d:	55                   	push   %ebp
    418e:	e8 3d df ff ff       	call   20d0 <_ZNSo9_M_insertIxEERSoT_@plt>
    4193:	e9 59 ff ff ff       	jmp    40f1 <.L45+0x71>
    4198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    419f:	00 

000041a0 <.L52>:
    41a0:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    41a6:	8d 74 24 10          	lea    0x10(%esp),%esi
    41aa:	8d 6c 24 20          	lea    0x20(%esp),%ebp
    41ae:	89 34 24             	mov    %esi,(%esp)
    41b1:	8d b3 7f c1 ff ff    	lea    -0x3e81(%ebx),%esi
    41b7:	8b 07                	mov    (%edi),%eax
    41b9:	83 ec 08             	sub    $0x8,%esp
    41bc:	83 ed 04             	sub    $0x4,%ebp
    41bf:	8b 50 f4             	mov    -0xc(%eax),%edx
    41c2:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    41c9:	00 
    41ca:	ff 75 10             	push   0x10(%ebp)
    41cd:	57                   	push   %edi
    41ce:	e8 ed e1 ff ff       	call   23c0 <_ZNSolsEi@plt>
    41d3:	83 c4 0c             	add    $0xc,%esp
    41d6:	6a 03                	push   $0x3
    41d8:	56                   	push   %esi
    41d9:	50                   	push   %eax
    41da:	e8 01 e1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    41df:	83 c4 10             	add    $0x10,%esp
    41e2:	39 2c 24             	cmp    %ebp,(%esp)
    41e5:	75 d0                	jne    41b7 <.L52+0x17>
    41e7:	e9 14 ff ff ff       	jmp    4100 <.L43>
    41ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000041f0 <.L51>:
    41f0:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    41f6:	8d 74 24 20          	lea    0x20(%esp),%esi
    41fa:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    4200:	89 74 24 10          	mov    %esi,0x10(%esp)
    4204:	8d 74 24 2e          	lea    0x2e(%esp),%esi
    4208:	8b 55 00             	mov    0x0(%ebp),%edx
    420b:	0f bf 06             	movswl (%esi),%eax
    420e:	83 ec 08             	sub    $0x8,%esp
    4211:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4214:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    421b:	00 
    421c:	50                   	push   %eax
    421d:	55                   	push   %ebp
    421e:	e8 1d e0 ff ff       	call   2240 <_ZNSolsEs@plt>
    4223:	83 c4 0c             	add    $0xc,%esp
    4226:	6a 03                	push   $0x3
    4228:	57                   	push   %edi
    4229:	50                   	push   %eax
    422a:	e8 b1 e0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    422f:	58                   	pop    %eax
    4230:	5a                   	pop    %edx
    4231:	8b 55 00             	mov    0x0(%ebp),%edx
    4234:	0f bf 46 fe          	movswl -0x2(%esi),%eax
    4238:	8b 4a f4             	mov    -0xc(%edx),%ecx
    423b:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    4242:	00 
    4243:	50                   	push   %eax
    4244:	55                   	push   %ebp
    4245:	e8 f6 df ff ff       	call   2240 <_ZNSolsEs@plt>
    424a:	83 c4 0c             	add    $0xc,%esp
    424d:	6a 03                	push   $0x3
    424f:	57                   	push   %edi
    4250:	50                   	push   %eax
    4251:	e8 8a e0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4256:	8b 55 00             	mov    0x0(%ebp),%edx
    4259:	59                   	pop    %ecx
    425a:	58                   	pop    %eax
    425b:	0f bf 46 fc          	movswl -0x4(%esi),%eax
    425f:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4262:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    4269:	00 
    426a:	50                   	push   %eax
    426b:	55                   	push   %ebp
    426c:	e8 cf df ff ff       	call   2240 <_ZNSolsEs@plt>
    4271:	83 c4 0c             	add    $0xc,%esp
    4274:	6a 03                	push   $0x3
    4276:	57                   	push   %edi
    4277:	50                   	push   %eax
    4278:	e8 63 e0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    427d:	8b 4d 00             	mov    0x0(%ebp),%ecx
    4280:	8d 56 fa             	lea    -0x6(%esi),%edx
    4283:	83 ee 08             	sub    $0x8,%esi
    4286:	89 54 24 10          	mov    %edx,0x10(%esp)
    428a:	58                   	pop    %eax
    428b:	5a                   	pop    %edx
    428c:	0f bf 56 02          	movswl 0x2(%esi),%edx
    4290:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4293:	c7 44 05 08 06 00 00 	movl   $0x6,0x8(%ebp,%eax,1)
    429a:	00 
    429b:	52                   	push   %edx
    429c:	55                   	push   %ebp
    429d:	e8 9e df ff ff       	call   2240 <_ZNSolsEs@plt>
    42a2:	83 c4 0c             	add    $0xc,%esp
    42a5:	6a 03                	push   $0x3
    42a7:	57                   	push   %edi
    42a8:	50                   	push   %eax
    42a9:	e8 32 e0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    42ae:	83 c4 10             	add    $0x10,%esp
    42b1:	8b 0c 24             	mov    (%esp),%ecx
    42b4:	39 4c 24 10          	cmp    %ecx,0x10(%esp)
    42b8:	0f 85 4a ff ff ff    	jne    4208 <.L51+0x18>
    42be:	e9 3d fe ff ff       	jmp    4100 <.L43>
    42c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    42ca:	00 
    42cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000042d0 <.L50>:
    42d0:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    42d6:	8d 74 24 20          	lea    0x20(%esp),%esi
    42da:	c5 f9 7f 44 24 20    	vmovdqa %xmm0,0x20(%esp)
    42e0:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    42e6:	89 74 24 10          	mov    %esi,0x10(%esp)
    42ea:	8d 74 24 2f          	lea    0x2f(%esp),%esi
    42ee:	8b 4d 00             	mov    0x0(%ebp),%ecx
    42f1:	0f be 16             	movsbl (%esi),%edx
    42f4:	83 ec 08             	sub    $0x8,%esp
    42f7:	8b 41 f4             	mov    -0xc(%ecx),%eax
    42fa:	c7 44 05 08 03 00 00 	movl   $0x3,0x8(%ebp,%eax,1)
    4301:	00 
    4302:	52                   	push   %edx
    4303:	55                   	push   %ebp
    4304:	e8 b7 e0 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4309:	83 c4 0c             	add    $0xc,%esp
    430c:	6a 03                	push   $0x3
    430e:	57                   	push   %edi
    430f:	50                   	push   %eax
    4310:	e8 cb df ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4315:	59                   	pop    %ecx
    4316:	8b 4d 00             	mov    0x0(%ebp),%ecx
    4319:	0f be 56 ff          	movsbl -0x1(%esi),%edx
    431d:	58                   	pop    %eax
    431e:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4321:	c7 44 05 08 03 00 00 	movl   $0x3,0x8(%ebp,%eax,1)
    4328:	00 
    4329:	52                   	push   %edx
    432a:	55                   	push   %ebp
    432b:	e8 90 e0 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4330:	83 c4 0c             	add    $0xc,%esp
    4333:	6a 03                	push   $0x3
    4335:	57                   	push   %edi
    4336:	50                   	push   %eax
    4337:	e8 a4 df ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    433c:	8b 4d 00             	mov    0x0(%ebp),%ecx
    433f:	58                   	pop    %eax
    4340:	5a                   	pop    %edx
    4341:	0f be 56 fe          	movsbl -0x2(%esi),%edx
    4345:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4348:	c7 44 05 08 03 00 00 	movl   $0x3,0x8(%ebp,%eax,1)
    434f:	00 
    4350:	52                   	push   %edx
    4351:	55                   	push   %ebp
    4352:	e8 69 e0 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4357:	83 c4 0c             	add    $0xc,%esp
    435a:	6a 03                	push   $0x3
    435c:	57                   	push   %edi
    435d:	50                   	push   %eax
    435e:	e8 7d df ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4363:	8d 4e fd             	lea    -0x3(%esi),%ecx
    4366:	83 ee 04             	sub    $0x4,%esi
    4369:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    436d:	59                   	pop    %ecx
    436e:	58                   	pop    %eax
    436f:	8b 45 00             	mov    0x0(%ebp),%eax
    4372:	0f be 4e 01          	movsbl 0x1(%esi),%ecx
    4376:	8b 50 f4             	mov    -0xc(%eax),%edx
    4379:	c7 44 15 08 03 00 00 	movl   $0x3,0x8(%ebp,%edx,1)
    4380:	00 
    4381:	51                   	push   %ecx
    4382:	55                   	push   %ebp
    4383:	e8 38 e0 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4388:	83 c4 0c             	add    $0xc,%esp
    438b:	6a 03                	push   $0x3
    438d:	57                   	push   %edi
    438e:	50                   	push   %eax
    438f:	e8 4c df ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4394:	83 c4 10             	add    $0x10,%esp
    4397:	8b 04 24             	mov    (%esp),%eax
    439a:	39 44 24 10          	cmp    %eax,0x10(%esp)
    439e:	0f 85 4a ff ff ff    	jne    42ee <.L50+0x1e>
    43a4:	e9 57 fd ff ff       	jmp    4100 <.L43>
    43a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000043b0 <.L49>:
    43b0:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    43b6:	8d 74 24 20          	lea    0x20(%esp),%esi
    43ba:	c5 f9 7f 44 24 20    	vmovdqa %xmm0,0x20(%esp)
    43c0:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    43c6:	89 74 24 10          	mov    %esi,0x10(%esp)
    43ca:	8d 74 24 2f          	lea    0x2f(%esp),%esi
    43ce:	8b 45 00             	mov    0x0(%ebp),%eax
    43d1:	0f b6 0e             	movzbl (%esi),%ecx
    43d4:	83 ec 08             	sub    $0x8,%esp
    43d7:	8b 50 f4             	mov    -0xc(%eax),%edx
    43da:	c7 44 15 08 03 00 00 	movl   $0x3,0x8(%ebp,%edx,1)
    43e1:	00 
    43e2:	51                   	push   %ecx
    43e3:	55                   	push   %ebp
    43e4:	e8 d7 df ff ff       	call   23c0 <_ZNSolsEi@plt>
    43e9:	83 c4 0c             	add    $0xc,%esp
    43ec:	6a 03                	push   $0x3
    43ee:	57                   	push   %edi
    43ef:	50                   	push   %eax
    43f0:	e8 eb de ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    43f5:	59                   	pop    %ecx
    43f6:	58                   	pop    %eax
    43f7:	8b 45 00             	mov    0x0(%ebp),%eax
    43fa:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
    43fe:	8b 50 f4             	mov    -0xc(%eax),%edx
    4401:	c7 44 15 08 03 00 00 	movl   $0x3,0x8(%ebp,%edx,1)
    4408:	00 
    4409:	51                   	push   %ecx
    440a:	55                   	push   %ebp
    440b:	e8 b0 df ff ff       	call   23c0 <_ZNSolsEi@plt>
    4410:	83 c4 0c             	add    $0xc,%esp
    4413:	6a 03                	push   $0x3
    4415:	57                   	push   %edi
    4416:	50                   	push   %eax
    4417:	e8 c4 de ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    441c:	58                   	pop    %eax
    441d:	8b 45 00             	mov    0x0(%ebp),%eax
    4420:	5a                   	pop    %edx
    4421:	0f b6 4e fe          	movzbl -0x2(%esi),%ecx
    4425:	8b 50 f4             	mov    -0xc(%eax),%edx
    4428:	c7 44 15 08 03 00 00 	movl   $0x3,0x8(%ebp,%edx,1)
    442f:	00 
    4430:	51                   	push   %ecx
    4431:	55                   	push   %ebp
    4432:	e8 89 df ff ff       	call   23c0 <_ZNSolsEi@plt>
    4437:	83 c4 0c             	add    $0xc,%esp
    443a:	6a 03                	push   $0x3
    443c:	57                   	push   %edi
    443d:	50                   	push   %eax
    443e:	e8 9d de ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4443:	8b 55 00             	mov    0x0(%ebp),%edx
    4446:	8d 46 fd             	lea    -0x3(%esi),%eax
    4449:	83 ee 04             	sub    $0x4,%esi
    444c:	89 44 24 10          	mov    %eax,0x10(%esp)
    4450:	59                   	pop    %ecx
    4451:	58                   	pop    %eax
    4452:	0f b6 46 01          	movzbl 0x1(%esi),%eax
    4456:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4459:	c7 44 0d 08 03 00 00 	movl   $0x3,0x8(%ebp,%ecx,1)
    4460:	00 
    4461:	50                   	push   %eax
    4462:	55                   	push   %ebp
    4463:	e8 58 df ff ff       	call   23c0 <_ZNSolsEi@plt>
    4468:	83 c4 0c             	add    $0xc,%esp
    446b:	6a 03                	push   $0x3
    446d:	57                   	push   %edi
    446e:	50                   	push   %eax
    446f:	e8 6c de ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4474:	83 c4 10             	add    $0x10,%esp
    4477:	8b 14 24             	mov    (%esp),%edx
    447a:	39 54 24 10          	cmp    %edx,0x10(%esp)
    447e:	0f 85 4a ff ff ff    	jne    43ce <.L49+0x1e>
    4484:	e9 77 fc ff ff       	jmp    4100 <.L43>
    4489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004490 <.L48>:
    4490:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    4496:	8d 44 24 20          	lea    0x20(%esp),%eax
    449a:	8d 74 24 2e          	lea    0x2e(%esp),%esi
    449e:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    44a4:	89 44 24 10          	mov    %eax,0x10(%esp)
    44a8:	8b 55 00             	mov    0x0(%ebp),%edx
    44ab:	0f b7 06             	movzwl (%esi),%eax
    44ae:	83 ec 08             	sub    $0x8,%esp
    44b1:	8b 4a f4             	mov    -0xc(%edx),%ecx
    44b4:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    44bb:	00 
    44bc:	50                   	push   %eax
    44bd:	55                   	push   %ebp
    44be:	e8 bd dc ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    44c3:	83 c4 0c             	add    $0xc,%esp
    44c6:	6a 03                	push   $0x3
    44c8:	57                   	push   %edi
    44c9:	50                   	push   %eax
    44ca:	e8 11 de ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    44cf:	58                   	pop    %eax
    44d0:	5a                   	pop    %edx
    44d1:	8b 55 00             	mov    0x0(%ebp),%edx
    44d4:	0f b7 46 fe          	movzwl -0x2(%esi),%eax
    44d8:	8b 4a f4             	mov    -0xc(%edx),%ecx
    44db:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    44e2:	00 
    44e3:	50                   	push   %eax
    44e4:	55                   	push   %ebp
    44e5:	e8 96 dc ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    44ea:	83 c4 0c             	add    $0xc,%esp
    44ed:	6a 03                	push   $0x3
    44ef:	57                   	push   %edi
    44f0:	50                   	push   %eax
    44f1:	e8 ea dd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    44f6:	8b 55 00             	mov    0x0(%ebp),%edx
    44f9:	59                   	pop    %ecx
    44fa:	58                   	pop    %eax
    44fb:	0f b7 46 fc          	movzwl -0x4(%esi),%eax
    44ff:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4502:	c7 44 0d 08 06 00 00 	movl   $0x6,0x8(%ebp,%ecx,1)
    4509:	00 
    450a:	50                   	push   %eax
    450b:	55                   	push   %ebp
    450c:	e8 6f dc ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    4511:	83 c4 0c             	add    $0xc,%esp
    4514:	6a 03                	push   $0x3
    4516:	57                   	push   %edi
    4517:	50                   	push   %eax
    4518:	e8 c3 dd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    451d:	8b 4d 00             	mov    0x0(%ebp),%ecx
    4520:	8d 56 fa             	lea    -0x6(%esi),%edx
    4523:	83 ee 08             	sub    $0x8,%esi
    4526:	89 54 24 10          	mov    %edx,0x10(%esp)
    452a:	58                   	pop    %eax
    452b:	5a                   	pop    %edx
    452c:	0f b7 56 02          	movzwl 0x2(%esi),%edx
    4530:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4533:	c7 44 05 08 06 00 00 	movl   $0x6,0x8(%ebp,%eax,1)
    453a:	00 
    453b:	52                   	push   %edx
    453c:	55                   	push   %ebp
    453d:	e8 3e dc ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    4542:	83 c4 0c             	add    $0xc,%esp
    4545:	6a 03                	push   $0x3
    4547:	57                   	push   %edi
    4548:	50                   	push   %eax
    4549:	e8 92 dd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    454e:	83 c4 10             	add    $0x10,%esp
    4551:	8b 0c 24             	mov    (%esp),%ecx
    4554:	39 4c 24 10          	cmp    %ecx,0x10(%esp)
    4558:	0f 85 4a ff ff ff    	jne    44a8 <.L48+0x18>
    455e:	e9 9d fb ff ff       	jmp    4100 <.L43>
    4563:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    456a:	00 
    456b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004570 <.L47>:
    4570:	8d 7c 24 10          	lea    0x10(%esp),%edi
    4574:	8d 6c 24 20          	lea    0x20(%esp),%ebp
    4578:	8d b3 7f c1 ff ff    	lea    -0x3e81(%ebx),%esi
    457e:	89 3c 24             	mov    %edi,(%esp)
    4581:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4587:	8b 17                	mov    (%edi),%edx
    4589:	83 ec 08             	sub    $0x8,%esp
    458c:	83 ed 04             	sub    $0x4,%ebp
    458f:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4592:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    4599:	00 
    459a:	ff 75 10             	push   0x10(%ebp)
    459d:	57                   	push   %edi
    459e:	e8 dd db ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    45a3:	83 c4 0c             	add    $0xc,%esp
    45a6:	6a 03                	push   $0x3
    45a8:	56                   	push   %esi
    45a9:	50                   	push   %eax
    45aa:	e8 31 dd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    45af:	83 c4 10             	add    $0x10,%esp
    45b2:	39 2c 24             	cmp    %ebp,(%esp)
    45b5:	75 d0                	jne    4587 <.L47+0x17>
    45b7:	e9 44 fb ff ff       	jmp    4100 <.L43>
    45bc:	e8 df 63 00 00       	call   a9a0 <__stack_chk_fail_local>
    45c1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    45c8:	00 
    45c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000045d0 <_ZN2ez2ii10print_f128ERSoDv4_f>:
    45d0:	55                   	push   %ebp
    45d1:	57                   	push   %edi
    45d2:	56                   	push   %esi
    45d3:	53                   	push   %ebx
    45d4:	e8 57 f2 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    45d9:	81 c3 e3 a8 00 00    	add    $0xa8e3,%ebx
    45df:	83 ec 2c             	sub    $0x2c,%esp
    45e2:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    45e8:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    45ee:	89 e0                	mov    %esp,%eax
    45f0:	c5 f8 29 44 24 10    	vmovaps %xmm0,0x10(%esp)
    45f6:	8d 74 24 10          	lea    0x10(%esp),%esi
    45fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    45fe:	8b 55 00             	mov    0x0(%ebp),%edx
    4601:	83 ec 0c             	sub    $0xc,%esp
    4604:	d9 46 0c             	flds   0xc(%esi)
    4607:	83 ee 04             	sub    $0x4,%esi
    460a:	8b 4a f4             	mov    -0xc(%edx),%ecx
    460d:	01 e9                	add    %ebp,%ecx
    460f:	8b 41 0c             	mov    0xc(%ecx),%eax
    4612:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    4617:	83 c8 04             	or     $0x4,%eax
    461a:	89 41 0c             	mov    %eax,0xc(%ecx)
    461d:	dd 1c 24             	fstpl  (%esp)
    4620:	55                   	push   %ebp
    4621:	e8 3a dd ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    4626:	83 c4 0c             	add    $0xc,%esp
    4629:	6a 03                	push   $0x3
    462b:	57                   	push   %edi
    462c:	50                   	push   %eax
    462d:	e8 ae dc ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4632:	83 c4 10             	add    $0x10,%esp
    4635:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    4639:	75 c3                	jne    45fe <_ZN2ez2ii10print_f128ERSoDv4_f+0x2e>
    463b:	83 c4 2c             	add    $0x2c,%esp
    463e:	5b                   	pop    %ebx
    463f:	5e                   	pop    %esi
    4640:	5f                   	pop    %edi
    4641:	5d                   	pop    %ebp
    4642:	c3                   	ret
    4643:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    464a:	00 
    464b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004650 <_ZN2ez2ii10print_d128ERSoDv2_d>:
    4650:	57                   	push   %edi
    4651:	56                   	push   %esi
    4652:	53                   	push   %ebx
    4653:	c5 f9 15 c8          	vunpckhpd %xmm0,%xmm0,%xmm1
    4657:	e8 d4 f1 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    465c:	81 c3 60 a8 00 00    	add    $0xa860,%ebx
    4662:	83 ec 1c             	sub    $0x1c,%esp
    4665:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    466b:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    4671:	c5 f9 29 44 24 0c    	vmovapd %xmm0,0xc(%esp)
    4677:	8b 06                	mov    (%esi),%eax
    4679:	8b 50 f4             	mov    -0xc(%eax),%edx
    467c:	01 f2                	add    %esi,%edx
    467e:	8b 4a 0c             	mov    0xc(%edx),%ecx
    4681:	81 e1 fb fe ff ff    	and    $0xfffffefb,%ecx
    4687:	83 c9 04             	or     $0x4,%ecx
    468a:	89 4a 0c             	mov    %ecx,0xc(%edx)
    468d:	c5 fb 11 0c 24       	vmovsd %xmm1,(%esp)
    4692:	56                   	push   %esi
    4693:	e8 c8 dc ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    4698:	83 c4 0c             	add    $0xc,%esp
    469b:	6a 03                	push   $0x3
    469d:	57                   	push   %edi
    469e:	50                   	push   %eax
    469f:	e8 3c dc ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    46a4:	8b 06                	mov    (%esi),%eax
    46a6:	c5 f9 28 44 24 10    	vmovapd 0x10(%esp),%xmm0
    46ac:	8b 50 f4             	mov    -0xc(%eax),%edx
    46af:	01 f2                	add    %esi,%edx
    46b1:	8b 4a 0c             	mov    0xc(%edx),%ecx
    46b4:	81 e1 fb fe ff ff    	and    $0xfffffefb,%ecx
    46ba:	83 c9 04             	or     $0x4,%ecx
    46bd:	89 4a 0c             	mov    %ecx,0xc(%edx)
    46c0:	c5 fb 11 44 24 04    	vmovsd %xmm0,0x4(%esp)
    46c6:	89 34 24             	mov    %esi,(%esp)
    46c9:	e8 92 dc ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    46ce:	83 c4 0c             	add    $0xc,%esp
    46d1:	6a 03                	push   $0x3
    46d3:	57                   	push   %edi
    46d4:	50                   	push   %eax
    46d5:	e8 06 dc ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    46da:	83 c4 20             	add    $0x20,%esp
    46dd:	5b                   	pop    %ebx
    46de:	5e                   	pop    %esi
    46df:	5f                   	pop    %edi
    46e0:	c3                   	ret
    46e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    46e8:	00 
    46e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000046f0 <_ZN2ez2ii16print_i256_u32x8ERSoDv4_x>:
    46f0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    46f4:	83 e4 e0             	and    $0xffffffe0,%esp
    46f7:	ff 71 fc             	push   -0x4(%ecx)
    46fa:	55                   	push   %ebp
    46fb:	89 e5                	mov    %esp,%ebp
    46fd:	57                   	push   %edi
    46fe:	56                   	push   %esi
    46ff:	53                   	push   %ebx
    4700:	e8 2b f1 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4705:	81 c3 b7 a7 00 00    	add    $0xa7b7,%ebx
    470b:	51                   	push   %ecx
    470c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    470f:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4715:	8d 75 e7             	lea    -0x19(%ebp),%esi
    4718:	83 ec 48             	sub    $0x48,%esp
    471b:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4720:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4726:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4729:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    472c:	c5 f8 77             	vzeroupper
    472f:	90                   	nop
    4730:	8b 0f                	mov    (%edi),%ecx
    4732:	0f b6 16             	movzbl (%esi),%edx
    4735:	83 ec 08             	sub    $0x8,%esp
    4738:	8b 41 f4             	mov    -0xc(%ecx),%eax
    473b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    4742:	00 
    4743:	52                   	push   %edx
    4744:	57                   	push   %edi
    4745:	e8 76 dc ff ff       	call   23c0 <_ZNSolsEi@plt>
    474a:	83 c4 0c             	add    $0xc,%esp
    474d:	6a 03                	push   $0x3
    474f:	ff 75 c4             	push   -0x3c(%ebp)
    4752:	50                   	push   %eax
    4753:	e8 88 db ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4758:	8b 0f                	mov    (%edi),%ecx
    475a:	58                   	pop    %eax
    475b:	5a                   	pop    %edx
    475c:	0f b6 56 ff          	movzbl -0x1(%esi),%edx
    4760:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4763:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    476a:	00 
    476b:	52                   	push   %edx
    476c:	57                   	push   %edi
    476d:	e8 4e dc ff ff       	call   23c0 <_ZNSolsEi@plt>
    4772:	83 c4 0c             	add    $0xc,%esp
    4775:	6a 03                	push   $0x3
    4777:	ff 75 c4             	push   -0x3c(%ebp)
    477a:	50                   	push   %eax
    477b:	e8 60 db ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4780:	59                   	pop    %ecx
    4781:	8b 0f                	mov    (%edi),%ecx
    4783:	0f b6 56 fe          	movzbl -0x2(%esi),%edx
    4787:	58                   	pop    %eax
    4788:	8b 41 f4             	mov    -0xc(%ecx),%eax
    478b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    4792:	00 
    4793:	52                   	push   %edx
    4794:	57                   	push   %edi
    4795:	e8 26 dc ff ff       	call   23c0 <_ZNSolsEi@plt>
    479a:	83 c4 0c             	add    $0xc,%esp
    479d:	6a 03                	push   $0x3
    479f:	ff 75 c4             	push   -0x3c(%ebp)
    47a2:	50                   	push   %eax
    47a3:	e8 38 db ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    47a8:	8d 4e fd             	lea    -0x3(%esi),%ecx
    47ab:	83 ee 04             	sub    $0x4,%esi
    47ae:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    47b1:	58                   	pop    %eax
    47b2:	8b 07                	mov    (%edi),%eax
    47b4:	5a                   	pop    %edx
    47b5:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
    47b9:	8b 50 f4             	mov    -0xc(%eax),%edx
    47bc:	c7 44 17 08 03 00 00 	movl   $0x3,0x8(%edi,%edx,1)
    47c3:	00 
    47c4:	51                   	push   %ecx
    47c5:	57                   	push   %edi
    47c6:	e8 f5 db ff ff       	call   23c0 <_ZNSolsEi@plt>
    47cb:	83 c4 0c             	add    $0xc,%esp
    47ce:	6a 03                	push   $0x3
    47d0:	ff 75 c4             	push   -0x3c(%ebp)
    47d3:	50                   	push   %eax
    47d4:	e8 07 db ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    47d9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    47dc:	83 c4 10             	add    $0x10,%esp
    47df:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    47e2:	0f 85 48 ff ff ff    	jne    4730 <_ZN2ez2ii16print_i256_u32x8ERSoDv4_x+0x40>
    47e8:	8d 65 f0             	lea    -0x10(%ebp),%esp
    47eb:	59                   	pop    %ecx
    47ec:	5b                   	pop    %ebx
    47ed:	5e                   	pop    %esi
    47ee:	5f                   	pop    %edi
    47ef:	5d                   	pop    %ebp
    47f0:	8d 61 fc             	lea    -0x4(%ecx),%esp
    47f3:	c3                   	ret
    47f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    47fb:	00 
    47fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004800 <_ZN2ez2ii17print_i256_u16x16ERSoDv4_x>:
    4800:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4804:	83 e4 e0             	and    $0xffffffe0,%esp
    4807:	ff 71 fc             	push   -0x4(%ecx)
    480a:	55                   	push   %ebp
    480b:	89 e5                	mov    %esp,%ebp
    480d:	57                   	push   %edi
    480e:	56                   	push   %esi
    480f:	53                   	push   %ebx
    4810:	e8 1b f0 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4815:	81 c3 a7 a6 00 00    	add    $0xa6a7,%ebx
    481b:	51                   	push   %ecx
    481c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    481f:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4825:	8d 75 e6             	lea    -0x1a(%ebp),%esi
    4828:	83 ec 48             	sub    $0x48,%esp
    482b:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4830:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4836:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4839:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    483c:	c5 f8 77             	vzeroupper
    483f:	8b 0f                	mov    (%edi),%ecx
    4841:	0f b7 16             	movzwl (%esi),%edx
    4844:	83 ec 08             	sub    $0x8,%esp
    4847:	8b 41 f4             	mov    -0xc(%ecx),%eax
    484a:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    4851:	00 
    4852:	52                   	push   %edx
    4853:	57                   	push   %edi
    4854:	e8 27 d9 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    4859:	83 c4 0c             	add    $0xc,%esp
    485c:	6a 03                	push   $0x3
    485e:	ff 75 c4             	push   -0x3c(%ebp)
    4861:	50                   	push   %eax
    4862:	e8 79 da ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4867:	8b 0f                	mov    (%edi),%ecx
    4869:	58                   	pop    %eax
    486a:	5a                   	pop    %edx
    486b:	0f b7 56 fe          	movzwl -0x2(%esi),%edx
    486f:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4872:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    4879:	00 
    487a:	52                   	push   %edx
    487b:	57                   	push   %edi
    487c:	e8 ff d8 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    4881:	83 c4 0c             	add    $0xc,%esp
    4884:	6a 03                	push   $0x3
    4886:	ff 75 c4             	push   -0x3c(%ebp)
    4889:	50                   	push   %eax
    488a:	e8 51 da ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    488f:	59                   	pop    %ecx
    4890:	8b 0f                	mov    (%edi),%ecx
    4892:	0f b7 56 fc          	movzwl -0x4(%esi),%edx
    4896:	58                   	pop    %eax
    4897:	8b 41 f4             	mov    -0xc(%ecx),%eax
    489a:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    48a1:	00 
    48a2:	52                   	push   %edx
    48a3:	57                   	push   %edi
    48a4:	e8 d7 d8 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    48a9:	83 c4 0c             	add    $0xc,%esp
    48ac:	6a 03                	push   $0x3
    48ae:	ff 75 c4             	push   -0x3c(%ebp)
    48b1:	50                   	push   %eax
    48b2:	e8 29 da ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    48b7:	8d 4e fa             	lea    -0x6(%esi),%ecx
    48ba:	83 ee 08             	sub    $0x8,%esi
    48bd:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    48c0:	58                   	pop    %eax
    48c1:	8b 07                	mov    (%edi),%eax
    48c3:	5a                   	pop    %edx
    48c4:	0f b7 4e 02          	movzwl 0x2(%esi),%ecx
    48c8:	8b 50 f4             	mov    -0xc(%eax),%edx
    48cb:	c7 44 17 08 06 00 00 	movl   $0x6,0x8(%edi,%edx,1)
    48d2:	00 
    48d3:	51                   	push   %ecx
    48d4:	57                   	push   %edi
    48d5:	e8 a6 d8 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    48da:	83 c4 0c             	add    $0xc,%esp
    48dd:	6a 03                	push   $0x3
    48df:	ff 75 c4             	push   -0x3c(%ebp)
    48e2:	50                   	push   %eax
    48e3:	e8 f8 d9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    48e8:	8b 45 c0             	mov    -0x40(%ebp),%eax
    48eb:	83 c4 10             	add    $0x10,%esp
    48ee:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    48f1:	0f 85 48 ff ff ff    	jne    483f <_ZN2ez2ii17print_i256_u16x16ERSoDv4_x+0x3f>
    48f7:	8d 65 f0             	lea    -0x10(%ebp),%esp
    48fa:	59                   	pop    %ecx
    48fb:	5b                   	pop    %ebx
    48fc:	5e                   	pop    %esi
    48fd:	5f                   	pop    %edi
    48fe:	5d                   	pop    %ebp
    48ff:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4902:	c3                   	ret
    4903:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    490a:	00 
    490b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004910 <_ZN2ez2ii16print_i256_u8x32ERSoDv4_x>:
    4910:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4914:	83 e4 e0             	and    $0xffffffe0,%esp
    4917:	ff 71 fc             	push   -0x4(%ecx)
    491a:	55                   	push   %ebp
    491b:	89 e5                	mov    %esp,%ebp
    491d:	57                   	push   %edi
    491e:	56                   	push   %esi
    491f:	53                   	push   %ebx
    4920:	e8 0b ef ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4925:	81 c3 97 a5 00 00    	add    $0xa597,%ebx
    492b:	51                   	push   %ecx
    492c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    492f:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4935:	8d 75 e4             	lea    -0x1c(%ebp),%esi
    4938:	83 ec 48             	sub    $0x48,%esp
    493b:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4940:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4946:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4949:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    494c:	c5 f8 77             	vzeroupper
    494f:	8b 0f                	mov    (%edi),%ecx
    4951:	83 ec 08             	sub    $0x8,%esp
    4954:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4957:	c7 44 07 08 0a 00 00 	movl   $0xa,0x8(%edi,%eax,1)
    495e:	00 
    495f:	ff 36                	push   (%esi)
    4961:	57                   	push   %edi
    4962:	e8 19 d8 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    4967:	83 c4 0c             	add    $0xc,%esp
    496a:	6a 03                	push   $0x3
    496c:	ff 75 c4             	push   -0x3c(%ebp)
    496f:	50                   	push   %eax
    4970:	e8 6b d9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4975:	58                   	pop    %eax
    4976:	5a                   	pop    %edx
    4977:	8b 17                	mov    (%edi),%edx
    4979:	8b 4a f4             	mov    -0xc(%edx),%ecx
    497c:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    4983:	00 
    4984:	ff 76 fc             	push   -0x4(%esi)
    4987:	57                   	push   %edi
    4988:	e8 f3 d7 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    498d:	83 c4 0c             	add    $0xc,%esp
    4990:	6a 03                	push   $0x3
    4992:	ff 75 c4             	push   -0x3c(%ebp)
    4995:	50                   	push   %eax
    4996:	e8 45 d9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    499b:	59                   	pop    %ecx
    499c:	58                   	pop    %eax
    499d:	8b 07                	mov    (%edi),%eax
    499f:	8b 50 f4             	mov    -0xc(%eax),%edx
    49a2:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    49a9:	00 
    49aa:	ff 76 f8             	push   -0x8(%esi)
    49ad:	57                   	push   %edi
    49ae:	e8 cd d7 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    49b3:	83 c4 0c             	add    $0xc,%esp
    49b6:	6a 03                	push   $0x3
    49b8:	ff 75 c4             	push   -0x3c(%ebp)
    49bb:	50                   	push   %eax
    49bc:	e8 1f d9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    49c1:	8d 4e f4             	lea    -0xc(%esi),%ecx
    49c4:	83 ee 10             	sub    $0x10,%esi
    49c7:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    49ca:	58                   	pop    %eax
    49cb:	8b 07                	mov    (%edi),%eax
    49cd:	5a                   	pop    %edx
    49ce:	8b 50 f4             	mov    -0xc(%eax),%edx
    49d1:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    49d8:	00 
    49d9:	ff 76 04             	push   0x4(%esi)
    49dc:	57                   	push   %edi
    49dd:	e8 9e d7 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    49e2:	83 c4 0c             	add    $0xc,%esp
    49e5:	6a 03                	push   $0x3
    49e7:	ff 75 c4             	push   -0x3c(%ebp)
    49ea:	50                   	push   %eax
    49eb:	e8 f0 d8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    49f0:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    49f3:	83 c4 10             	add    $0x10,%esp
    49f6:	39 4d bc             	cmp    %ecx,-0x44(%ebp)
    49f9:	0f 85 50 ff ff ff    	jne    494f <_ZN2ez2ii16print_i256_u8x32ERSoDv4_x+0x3f>
    49ff:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4a02:	59                   	pop    %ecx
    4a03:	5b                   	pop    %ebx
    4a04:	5e                   	pop    %esi
    4a05:	5f                   	pop    %edi
    4a06:	5d                   	pop    %ebp
    4a07:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4a0a:	c3                   	ret
    4a0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004a10 <_ZN2ez2ii16print_i256_u4x64ERSoDv4_x>:
    4a10:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4a14:	83 e4 e0             	and    $0xffffffe0,%esp
    4a17:	ff 71 fc             	push   -0x4(%ecx)
    4a1a:	55                   	push   %ebp
    4a1b:	89 e5                	mov    %esp,%ebp
    4a1d:	57                   	push   %edi
    4a1e:	56                   	push   %esi
    4a1f:	53                   	push   %ebx
    4a20:	e8 0b ee ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4a25:	81 c3 97 a4 00 00    	add    $0xa497,%ebx
    4a2b:	51                   	push   %ecx
    4a2c:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4a2f:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4a35:	8d 75 c8             	lea    -0x38(%ebp),%esi
    4a38:	83 ec 48             	sub    $0x48,%esp
    4a3b:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4a40:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4a46:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4a49:	89 55 c0             	mov    %edx,-0x40(%ebp)
    4a4c:	c5 f8 77             	vzeroupper
    4a4f:	8b 0f                	mov    (%edi),%ecx
    4a51:	83 ec 04             	sub    $0x4,%esp
    4a54:	83 ee 08             	sub    $0x8,%esi
    4a57:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4a5a:	c7 44 07 08 0a 00 00 	movl   $0xa,0x8(%edi,%eax,1)
    4a61:	00 
    4a62:	ff 76 24             	push   0x24(%esi)
    4a65:	ff 76 20             	push   0x20(%esi)
    4a68:	57                   	push   %edi
    4a69:	e8 02 d7 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    4a6e:	83 c4 0c             	add    $0xc,%esp
    4a71:	6a 03                	push   $0x3
    4a73:	ff 75 c0             	push   -0x40(%ebp)
    4a76:	50                   	push   %eax
    4a77:	e8 64 d8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4a7c:	83 c4 10             	add    $0x10,%esp
    4a7f:	39 75 c4             	cmp    %esi,-0x3c(%ebp)
    4a82:	75 cb                	jne    4a4f <_ZN2ez2ii16print_i256_u4x64ERSoDv4_x+0x3f>
    4a84:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4a87:	59                   	pop    %ecx
    4a88:	5b                   	pop    %ebx
    4a89:	5e                   	pop    %esi
    4a8a:	5f                   	pop    %edi
    4a8b:	5d                   	pop    %ebp
    4a8c:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4a8f:	c3                   	ret

00004a90 <_ZN2ez2ii16print_i256_i32x8ERSoDv4_x>:
    4a90:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4a94:	83 e4 e0             	and    $0xffffffe0,%esp
    4a97:	ff 71 fc             	push   -0x4(%ecx)
    4a9a:	55                   	push   %ebp
    4a9b:	89 e5                	mov    %esp,%ebp
    4a9d:	57                   	push   %edi
    4a9e:	56                   	push   %esi
    4a9f:	53                   	push   %ebx
    4aa0:	e8 8b ed ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4aa5:	81 c3 17 a4 00 00    	add    $0xa417,%ebx
    4aab:	51                   	push   %ecx
    4aac:	8d 45 c8             	lea    -0x38(%ebp),%eax
    4aaf:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4ab5:	8d 75 e7             	lea    -0x19(%ebp),%esi
    4ab8:	83 ec 48             	sub    $0x48,%esp
    4abb:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4ac0:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4ac6:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4ac9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    4acc:	c5 f8 77             	vzeroupper
    4acf:	90                   	nop
    4ad0:	8b 0f                	mov    (%edi),%ecx
    4ad2:	0f be 16             	movsbl (%esi),%edx
    4ad5:	83 ec 08             	sub    $0x8,%esp
    4ad8:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4adb:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    4ae2:	00 
    4ae3:	52                   	push   %edx
    4ae4:	57                   	push   %edi
    4ae5:	e8 d6 d8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4aea:	83 c4 0c             	add    $0xc,%esp
    4aed:	6a 03                	push   $0x3
    4aef:	ff 75 c4             	push   -0x3c(%ebp)
    4af2:	50                   	push   %eax
    4af3:	e8 e8 d7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4af8:	8b 0f                	mov    (%edi),%ecx
    4afa:	58                   	pop    %eax
    4afb:	5a                   	pop    %edx
    4afc:	0f be 56 ff          	movsbl -0x1(%esi),%edx
    4b00:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4b03:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    4b0a:	00 
    4b0b:	52                   	push   %edx
    4b0c:	57                   	push   %edi
    4b0d:	e8 ae d8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4b12:	83 c4 0c             	add    $0xc,%esp
    4b15:	6a 03                	push   $0x3
    4b17:	ff 75 c4             	push   -0x3c(%ebp)
    4b1a:	50                   	push   %eax
    4b1b:	e8 c0 d7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4b20:	59                   	pop    %ecx
    4b21:	8b 0f                	mov    (%edi),%ecx
    4b23:	0f be 56 fe          	movsbl -0x2(%esi),%edx
    4b27:	58                   	pop    %eax
    4b28:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4b2b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    4b32:	00 
    4b33:	52                   	push   %edx
    4b34:	57                   	push   %edi
    4b35:	e8 86 d8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4b3a:	83 c4 0c             	add    $0xc,%esp
    4b3d:	6a 03                	push   $0x3
    4b3f:	ff 75 c4             	push   -0x3c(%ebp)
    4b42:	50                   	push   %eax
    4b43:	e8 98 d7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4b48:	8d 4e fd             	lea    -0x3(%esi),%ecx
    4b4b:	83 ee 04             	sub    $0x4,%esi
    4b4e:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    4b51:	58                   	pop    %eax
    4b52:	8b 07                	mov    (%edi),%eax
    4b54:	5a                   	pop    %edx
    4b55:	0f be 4e 01          	movsbl 0x1(%esi),%ecx
    4b59:	8b 50 f4             	mov    -0xc(%eax),%edx
    4b5c:	c7 44 17 08 03 00 00 	movl   $0x3,0x8(%edi,%edx,1)
    4b63:	00 
    4b64:	51                   	push   %ecx
    4b65:	57                   	push   %edi
    4b66:	e8 55 d8 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4b6b:	83 c4 0c             	add    $0xc,%esp
    4b6e:	6a 03                	push   $0x3
    4b70:	ff 75 c4             	push   -0x3c(%ebp)
    4b73:	50                   	push   %eax
    4b74:	e8 67 d7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4b79:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b7c:	83 c4 10             	add    $0x10,%esp
    4b7f:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    4b82:	0f 85 48 ff ff ff    	jne    4ad0 <_ZN2ez2ii16print_i256_i32x8ERSoDv4_x+0x40>
    4b88:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4b8b:	59                   	pop    %ecx
    4b8c:	5b                   	pop    %ebx
    4b8d:	5e                   	pop    %esi
    4b8e:	5f                   	pop    %edi
    4b8f:	5d                   	pop    %ebp
    4b90:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4b93:	c3                   	ret
    4b94:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    4b9b:	00 
    4b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004ba0 <_ZN2ez2ii17print_i256_i16x16ERSoDv4_x>:
    4ba0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4ba4:	83 e4 e0             	and    $0xffffffe0,%esp
    4ba7:	ff 71 fc             	push   -0x4(%ecx)
    4baa:	55                   	push   %ebp
    4bab:	89 e5                	mov    %esp,%ebp
    4bad:	57                   	push   %edi
    4bae:	56                   	push   %esi
    4baf:	53                   	push   %ebx
    4bb0:	e8 7b ec ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4bb5:	81 c3 07 a3 00 00    	add    $0xa307,%ebx
    4bbb:	51                   	push   %ecx
    4bbc:	8d 45 c8             	lea    -0x38(%ebp),%eax
    4bbf:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4bc5:	8d 75 e6             	lea    -0x1a(%ebp),%esi
    4bc8:	83 ec 48             	sub    $0x48,%esp
    4bcb:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4bd0:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4bd6:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4bd9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    4bdc:	c5 f8 77             	vzeroupper
    4bdf:	8b 0f                	mov    (%edi),%ecx
    4be1:	0f bf 16             	movswl (%esi),%edx
    4be4:	83 ec 08             	sub    $0x8,%esp
    4be7:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4bea:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    4bf1:	00 
    4bf2:	52                   	push   %edx
    4bf3:	57                   	push   %edi
    4bf4:	e8 47 d6 ff ff       	call   2240 <_ZNSolsEs@plt>
    4bf9:	83 c4 0c             	add    $0xc,%esp
    4bfc:	6a 03                	push   $0x3
    4bfe:	ff 75 c4             	push   -0x3c(%ebp)
    4c01:	50                   	push   %eax
    4c02:	e8 d9 d6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4c07:	8b 0f                	mov    (%edi),%ecx
    4c09:	58                   	pop    %eax
    4c0a:	5a                   	pop    %edx
    4c0b:	0f bf 56 fe          	movswl -0x2(%esi),%edx
    4c0f:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4c12:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    4c19:	00 
    4c1a:	52                   	push   %edx
    4c1b:	57                   	push   %edi
    4c1c:	e8 1f d6 ff ff       	call   2240 <_ZNSolsEs@plt>
    4c21:	83 c4 0c             	add    $0xc,%esp
    4c24:	6a 03                	push   $0x3
    4c26:	ff 75 c4             	push   -0x3c(%ebp)
    4c29:	50                   	push   %eax
    4c2a:	e8 b1 d6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4c2f:	59                   	pop    %ecx
    4c30:	8b 0f                	mov    (%edi),%ecx
    4c32:	0f bf 56 fc          	movswl -0x4(%esi),%edx
    4c36:	58                   	pop    %eax
    4c37:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4c3a:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    4c41:	00 
    4c42:	52                   	push   %edx
    4c43:	57                   	push   %edi
    4c44:	e8 f7 d5 ff ff       	call   2240 <_ZNSolsEs@plt>
    4c49:	83 c4 0c             	add    $0xc,%esp
    4c4c:	6a 03                	push   $0x3
    4c4e:	ff 75 c4             	push   -0x3c(%ebp)
    4c51:	50                   	push   %eax
    4c52:	e8 89 d6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4c57:	8d 4e fa             	lea    -0x6(%esi),%ecx
    4c5a:	83 ee 08             	sub    $0x8,%esi
    4c5d:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    4c60:	58                   	pop    %eax
    4c61:	8b 07                	mov    (%edi),%eax
    4c63:	5a                   	pop    %edx
    4c64:	0f bf 4e 02          	movswl 0x2(%esi),%ecx
    4c68:	8b 50 f4             	mov    -0xc(%eax),%edx
    4c6b:	c7 44 17 08 06 00 00 	movl   $0x6,0x8(%edi,%edx,1)
    4c72:	00 
    4c73:	51                   	push   %ecx
    4c74:	57                   	push   %edi
    4c75:	e8 c6 d5 ff ff       	call   2240 <_ZNSolsEs@plt>
    4c7a:	83 c4 0c             	add    $0xc,%esp
    4c7d:	6a 03                	push   $0x3
    4c7f:	ff 75 c4             	push   -0x3c(%ebp)
    4c82:	50                   	push   %eax
    4c83:	e8 58 d6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4c88:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4c8b:	83 c4 10             	add    $0x10,%esp
    4c8e:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    4c91:	0f 85 48 ff ff ff    	jne    4bdf <_ZN2ez2ii17print_i256_i16x16ERSoDv4_x+0x3f>
    4c97:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4c9a:	59                   	pop    %ecx
    4c9b:	5b                   	pop    %ebx
    4c9c:	5e                   	pop    %esi
    4c9d:	5f                   	pop    %edi
    4c9e:	5d                   	pop    %ebp
    4c9f:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4ca2:	c3                   	ret
    4ca3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    4caa:	00 
    4cab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004cb0 <_ZN2ez2ii16print_i256_i8x32ERSoDv4_x>:
    4cb0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4cb4:	83 e4 e0             	and    $0xffffffe0,%esp
    4cb7:	ff 71 fc             	push   -0x4(%ecx)
    4cba:	55                   	push   %ebp
    4cbb:	89 e5                	mov    %esp,%ebp
    4cbd:	57                   	push   %edi
    4cbe:	56                   	push   %esi
    4cbf:	53                   	push   %ebx
    4cc0:	e8 6b eb ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4cc5:	81 c3 f7 a1 00 00    	add    $0xa1f7,%ebx
    4ccb:	51                   	push   %ecx
    4ccc:	8d 45 c8             	lea    -0x38(%ebp),%eax
    4ccf:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4cd5:	8d 75 e4             	lea    -0x1c(%ebp),%esi
    4cd8:	83 ec 48             	sub    $0x48,%esp
    4cdb:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4ce0:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4ce6:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4ce9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    4cec:	c5 f8 77             	vzeroupper
    4cef:	8b 0f                	mov    (%edi),%ecx
    4cf1:	83 ec 08             	sub    $0x8,%esp
    4cf4:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4cf7:	c7 44 07 08 0a 00 00 	movl   $0xa,0x8(%edi,%eax,1)
    4cfe:	00 
    4cff:	ff 36                	push   (%esi)
    4d01:	57                   	push   %edi
    4d02:	e8 b9 d6 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4d07:	83 c4 0c             	add    $0xc,%esp
    4d0a:	6a 03                	push   $0x3
    4d0c:	ff 75 c4             	push   -0x3c(%ebp)
    4d0f:	50                   	push   %eax
    4d10:	e8 cb d5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4d15:	58                   	pop    %eax
    4d16:	5a                   	pop    %edx
    4d17:	8b 17                	mov    (%edi),%edx
    4d19:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4d1c:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    4d23:	00 
    4d24:	ff 76 fc             	push   -0x4(%esi)
    4d27:	57                   	push   %edi
    4d28:	e8 93 d6 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4d2d:	83 c4 0c             	add    $0xc,%esp
    4d30:	6a 03                	push   $0x3
    4d32:	ff 75 c4             	push   -0x3c(%ebp)
    4d35:	50                   	push   %eax
    4d36:	e8 a5 d5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4d3b:	59                   	pop    %ecx
    4d3c:	58                   	pop    %eax
    4d3d:	8b 07                	mov    (%edi),%eax
    4d3f:	8b 50 f4             	mov    -0xc(%eax),%edx
    4d42:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    4d49:	00 
    4d4a:	ff 76 f8             	push   -0x8(%esi)
    4d4d:	57                   	push   %edi
    4d4e:	e8 6d d6 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4d53:	83 c4 0c             	add    $0xc,%esp
    4d56:	6a 03                	push   $0x3
    4d58:	ff 75 c4             	push   -0x3c(%ebp)
    4d5b:	50                   	push   %eax
    4d5c:	e8 7f d5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4d61:	8d 4e f4             	lea    -0xc(%esi),%ecx
    4d64:	83 ee 10             	sub    $0x10,%esi
    4d67:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    4d6a:	58                   	pop    %eax
    4d6b:	8b 07                	mov    (%edi),%eax
    4d6d:	5a                   	pop    %edx
    4d6e:	8b 50 f4             	mov    -0xc(%eax),%edx
    4d71:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    4d78:	00 
    4d79:	ff 76 04             	push   0x4(%esi)
    4d7c:	57                   	push   %edi
    4d7d:	e8 3e d6 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4d82:	83 c4 0c             	add    $0xc,%esp
    4d85:	6a 03                	push   $0x3
    4d87:	ff 75 c4             	push   -0x3c(%ebp)
    4d8a:	50                   	push   %eax
    4d8b:	e8 50 d5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4d90:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    4d93:	83 c4 10             	add    $0x10,%esp
    4d96:	39 4d bc             	cmp    %ecx,-0x44(%ebp)
    4d99:	0f 85 50 ff ff ff    	jne    4cef <_ZN2ez2ii16print_i256_i8x32ERSoDv4_x+0x3f>
    4d9f:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4da2:	59                   	pop    %ecx
    4da3:	5b                   	pop    %ebx
    4da4:	5e                   	pop    %esi
    4da5:	5f                   	pop    %edi
    4da6:	5d                   	pop    %ebp
    4da7:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4daa:	c3                   	ret
    4dab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004db0 <_ZN2ez2ii16print_i256_i4x64ERSoDv4_x>:
    4db0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4db4:	83 e4 e0             	and    $0xffffffe0,%esp
    4db7:	ff 71 fc             	push   -0x4(%ecx)
    4dba:	55                   	push   %ebp
    4dbb:	89 e5                	mov    %esp,%ebp
    4dbd:	57                   	push   %edi
    4dbe:	56                   	push   %esi
    4dbf:	53                   	push   %ebx
    4dc0:	e8 6b ea ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4dc5:	81 c3 f7 a0 00 00    	add    $0xa0f7,%ebx
    4dcb:	51                   	push   %ecx
    4dcc:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4dcf:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4dd5:	8d 75 c8             	lea    -0x38(%ebp),%esi
    4dd8:	83 ec 48             	sub    $0x48,%esp
    4ddb:	c5 fd 7f 45 c8       	vmovdqa %ymm0,-0x38(%ebp)
    4de0:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4de6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4de9:	89 55 c0             	mov    %edx,-0x40(%ebp)
    4dec:	c5 f8 77             	vzeroupper
    4def:	8b 0f                	mov    (%edi),%ecx
    4df1:	83 ec 04             	sub    $0x4,%esp
    4df4:	83 ee 08             	sub    $0x8,%esi
    4df7:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4dfa:	c7 44 07 08 0a 00 00 	movl   $0xa,0x8(%edi,%eax,1)
    4e01:	00 
    4e02:	ff 76 24             	push   0x24(%esi)
    4e05:	ff 76 20             	push   0x20(%esi)
    4e08:	57                   	push   %edi
    4e09:	e8 c2 d2 ff ff       	call   20d0 <_ZNSo9_M_insertIxEERSoT_@plt>
    4e0e:	83 c4 0c             	add    $0xc,%esp
    4e11:	6a 03                	push   $0x3
    4e13:	ff 75 c0             	push   -0x40(%ebp)
    4e16:	50                   	push   %eax
    4e17:	e8 c4 d4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4e1c:	83 c4 10             	add    $0x10,%esp
    4e1f:	39 75 c4             	cmp    %esi,-0x3c(%ebp)
    4e22:	75 cb                	jne    4def <_ZN2ez2ii16print_i256_i4x64ERSoDv4_x+0x3f>
    4e24:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4e27:	59                   	pop    %ecx
    4e28:	5b                   	pop    %ebx
    4e29:	5e                   	pop    %esi
    4e2a:	5f                   	pop    %edi
    4e2b:	5d                   	pop    %ebp
    4e2c:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4e2f:	c3                   	ret

00004e30 <_ZN2ez2ii10print_i256ERSoDv4_x>:
    4e30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4e34:	83 e4 e0             	and    $0xffffffe0,%esp
    4e37:	ff 71 fc             	push   -0x4(%ecx)
    4e3a:	55                   	push   %ebp
    4e3b:	89 e5                	mov    %esp,%ebp
    4e3d:	57                   	push   %edi
    4e3e:	56                   	push   %esi
    4e3f:	53                   	push   %ebx
    4e40:	e8 eb e9 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    4e45:	81 c3 77 a0 00 00    	add    $0xa077,%ebx
    4e4b:	51                   	push   %ecx
    4e4c:	83 ec 68             	sub    $0x68,%esp
    4e4f:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    4e55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4e58:	8b 83 50 01 00 00    	mov    0x150(%ebx),%eax
    4e5e:	83 c0 04             	add    $0x4,%eax
    4e61:	83 f8 08             	cmp    $0x8,%eax
    4e64:	77 6f                	ja     4ed5 <.L139>
    4e66:	8b 84 83 bc c5 ff ff 	mov    -0x3a44(%ebx,%eax,4),%eax
    4e6d:	01 d8                	add    %ebx,%eax
    4e6f:	ff e0                	jmp    *%eax
    4e71:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    4e78:	00 
    4e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004e80 <.L149>:
    4e80:	8d 7d 88             	lea    -0x78(%ebp),%edi
    4e83:	8d 83 7f c1 ff ff    	lea    -0x3e81(%ebx),%eax
    4e89:	c5 fd 7f 45 a8       	vmovdqa %ymm0,-0x58(%ebp)
    4e8e:	8d 75 a8             	lea    -0x58(%ebp),%esi
    4e91:	89 7d a4             	mov    %edi,-0x5c(%ebp)
    4e94:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4e97:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4e9d:	c5 f8 77             	vzeroupper
    4ea0:	8b 17                	mov    (%edi),%edx
    4ea2:	83 ec 04             	sub    $0x4,%esp
    4ea5:	83 ee 08             	sub    $0x8,%esi
    4ea8:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4eab:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    4eb2:	00 
    4eb3:	ff 76 24             	push   0x24(%esi)
    4eb6:	ff 76 20             	push   0x20(%esi)
    4eb9:	57                   	push   %edi
    4eba:	e8 11 d2 ff ff       	call   20d0 <_ZNSo9_M_insertIxEERSoT_@plt>
    4ebf:	83 c4 0c             	add    $0xc,%esp
    4ec2:	6a 03                	push   $0x3
    4ec4:	ff 75 a0             	push   -0x60(%ebp)
    4ec7:	50                   	push   %eax
    4ec8:	e8 13 d4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4ecd:	83 c4 10             	add    $0x10,%esp
    4ed0:	39 75 a4             	cmp    %esi,-0x5c(%ebp)
    4ed3:	75 cb                	jne    4ea0 <.L149+0x20>

00004ed5 <.L139>:
    4ed5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ed8:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    4edf:	0f 85 9b 05 00 00    	jne    5480 <.L143+0xd0>
    4ee5:	8d 65 f0             	lea    -0x10(%ebp),%esp
    4ee8:	59                   	pop    %ecx
    4ee9:	5b                   	pop    %ebx
    4eea:	5e                   	pop    %esi
    4eeb:	5f                   	pop    %edi
    4eec:	5d                   	pop    %ebp
    4eed:	8d 61 fc             	lea    -0x4(%ecx),%esp
    4ef0:	c3                   	ret
    4ef1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    4ef8:	00 
    4ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004f00 <.L141>:
    4f00:	8d 55 88             	lea    -0x78(%ebp),%edx
    4f03:	8d 8b 7f c1 ff ff    	lea    -0x3e81(%ebx),%ecx
    4f09:	c5 fd 7f 45 a8       	vmovdqa %ymm0,-0x58(%ebp)
    4f0e:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4f14:	8d 75 a8             	lea    -0x58(%ebp),%esi
    4f17:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    4f1a:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    4f1d:	c5 f8 77             	vzeroupper
    4f20:	8b 07                	mov    (%edi),%eax
    4f22:	83 ec 04             	sub    $0x4,%esp
    4f25:	83 ee 08             	sub    $0x8,%esi
    4f28:	8b 50 f4             	mov    -0xc(%eax),%edx
    4f2b:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    4f32:	00 
    4f33:	ff 76 24             	push   0x24(%esi)
    4f36:	ff 76 20             	push   0x20(%esi)
    4f39:	57                   	push   %edi
    4f3a:	e8 31 d2 ff ff       	call   2170 <_ZNSo9_M_insertIyEERSoT_@plt>
    4f3f:	83 c4 0c             	add    $0xc,%esp
    4f42:	6a 03                	push   $0x3
    4f44:	ff 75 a0             	push   -0x60(%ebp)
    4f47:	50                   	push   %eax
    4f48:	e8 93 d3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4f4d:	83 c4 10             	add    $0x10,%esp
    4f50:	39 75 a4             	cmp    %esi,-0x5c(%ebp)
    4f53:	75 cb                	jne    4f20 <.L141+0x20>
    4f55:	e9 7b ff ff ff       	jmp    4ed5 <.L139>
    4f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00004f60 <.L148>:
    4f60:	8d 75 a8             	lea    -0x58(%ebp),%esi
    4f63:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    4f69:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    4f6f:	89 75 9c             	mov    %esi,-0x64(%ebp)
    4f72:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    4f75:	8d 75 c4             	lea    -0x3c(%ebp),%esi
    4f78:	c5 f8 77             	vzeroupper
    4f7b:	8b 0f                	mov    (%edi),%ecx
    4f7d:	83 ec 08             	sub    $0x8,%esp
    4f80:	8b 41 f4             	mov    -0xc(%ecx),%eax
    4f83:	c7 44 07 08 0a 00 00 	movl   $0xa,0x8(%edi,%eax,1)
    4f8a:	00 
    4f8b:	ff 36                	push   (%esi)
    4f8d:	57                   	push   %edi
    4f8e:	e8 2d d4 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4f93:	83 c4 0c             	add    $0xc,%esp
    4f96:	6a 03                	push   $0x3
    4f98:	ff 75 a4             	push   -0x5c(%ebp)
    4f9b:	50                   	push   %eax
    4f9c:	e8 3f d3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4fa1:	58                   	pop    %eax
    4fa2:	5a                   	pop    %edx
    4fa3:	8b 17                	mov    (%edi),%edx
    4fa5:	8b 4a f4             	mov    -0xc(%edx),%ecx
    4fa8:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    4faf:	00 
    4fb0:	ff 76 fc             	push   -0x4(%esi)
    4fb3:	57                   	push   %edi
    4fb4:	e8 07 d4 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4fb9:	83 c4 0c             	add    $0xc,%esp
    4fbc:	6a 03                	push   $0x3
    4fbe:	ff 75 a4             	push   -0x5c(%ebp)
    4fc1:	50                   	push   %eax
    4fc2:	e8 19 d3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4fc7:	59                   	pop    %ecx
    4fc8:	58                   	pop    %eax
    4fc9:	8b 07                	mov    (%edi),%eax
    4fcb:	8b 50 f4             	mov    -0xc(%eax),%edx
    4fce:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    4fd5:	00 
    4fd6:	ff 76 f8             	push   -0x8(%esi)
    4fd9:	57                   	push   %edi
    4fda:	e8 e1 d3 ff ff       	call   23c0 <_ZNSolsEi@plt>
    4fdf:	83 c4 0c             	add    $0xc,%esp
    4fe2:	6a 03                	push   $0x3
    4fe4:	ff 75 a4             	push   -0x5c(%ebp)
    4fe7:	50                   	push   %eax
    4fe8:	e8 f3 d2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    4fed:	8d 4e f4             	lea    -0xc(%esi),%ecx
    4ff0:	83 ee 10             	sub    $0x10,%esi
    4ff3:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    4ff6:	58                   	pop    %eax
    4ff7:	8b 07                	mov    (%edi),%eax
    4ff9:	5a                   	pop    %edx
    4ffa:	8b 50 f4             	mov    -0xc(%eax),%edx
    4ffd:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    5004:	00 
    5005:	ff 76 04             	push   0x4(%esi)
    5008:	57                   	push   %edi
    5009:	e8 b2 d3 ff ff       	call   23c0 <_ZNSolsEi@plt>
    500e:	83 c4 0c             	add    $0xc,%esp
    5011:	6a 03                	push   $0x3
    5013:	ff 75 a4             	push   -0x5c(%ebp)
    5016:	50                   	push   %eax
    5017:	e8 c4 d2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    501c:	8b 4d a0             	mov    -0x60(%ebp),%ecx
    501f:	83 c4 10             	add    $0x10,%esp
    5022:	39 4d 9c             	cmp    %ecx,-0x64(%ebp)
    5025:	0f 85 50 ff ff ff    	jne    4f7b <.L148+0x1b>
    502b:	e9 a5 fe ff ff       	jmp    4ed5 <.L139>

00005030 <.L147>:
    5030:	8d 75 a8             	lea    -0x58(%ebp),%esi
    5033:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    5039:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    503f:	89 75 9c             	mov    %esi,-0x64(%ebp)
    5042:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    5045:	8d 75 c6             	lea    -0x3a(%ebp),%esi
    5048:	c5 f8 77             	vzeroupper
    504b:	8b 0f                	mov    (%edi),%ecx
    504d:	0f bf 16             	movswl (%esi),%edx
    5050:	83 ec 08             	sub    $0x8,%esp
    5053:	8b 41 f4             	mov    -0xc(%ecx),%eax
    5056:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    505d:	00 
    505e:	52                   	push   %edx
    505f:	57                   	push   %edi
    5060:	e8 db d1 ff ff       	call   2240 <_ZNSolsEs@plt>
    5065:	83 c4 0c             	add    $0xc,%esp
    5068:	6a 03                	push   $0x3
    506a:	ff 75 a4             	push   -0x5c(%ebp)
    506d:	50                   	push   %eax
    506e:	e8 6d d2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5073:	59                   	pop    %ecx
    5074:	8b 0f                	mov    (%edi),%ecx
    5076:	0f bf 56 fe          	movswl -0x2(%esi),%edx
    507a:	58                   	pop    %eax
    507b:	8b 41 f4             	mov    -0xc(%ecx),%eax
    507e:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    5085:	00 
    5086:	52                   	push   %edx
    5087:	57                   	push   %edi
    5088:	e8 b3 d1 ff ff       	call   2240 <_ZNSolsEs@plt>
    508d:	83 c4 0c             	add    $0xc,%esp
    5090:	6a 03                	push   $0x3
    5092:	ff 75 a4             	push   -0x5c(%ebp)
    5095:	50                   	push   %eax
    5096:	e8 45 d2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    509b:	8b 0f                	mov    (%edi),%ecx
    509d:	58                   	pop    %eax
    509e:	5a                   	pop    %edx
    509f:	0f bf 56 fc          	movswl -0x4(%esi),%edx
    50a3:	8b 41 f4             	mov    -0xc(%ecx),%eax
    50a6:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    50ad:	00 
    50ae:	52                   	push   %edx
    50af:	57                   	push   %edi
    50b0:	e8 8b d1 ff ff       	call   2240 <_ZNSolsEs@plt>
    50b5:	83 c4 0c             	add    $0xc,%esp
    50b8:	6a 03                	push   $0x3
    50ba:	ff 75 a4             	push   -0x5c(%ebp)
    50bd:	50                   	push   %eax
    50be:	e8 1d d2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    50c3:	8d 4e fa             	lea    -0x6(%esi),%ecx
    50c6:	83 ee 08             	sub    $0x8,%esi
    50c9:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    50cc:	59                   	pop    %ecx
    50cd:	58                   	pop    %eax
    50ce:	8b 07                	mov    (%edi),%eax
    50d0:	0f bf 4e 02          	movswl 0x2(%esi),%ecx
    50d4:	8b 50 f4             	mov    -0xc(%eax),%edx
    50d7:	c7 44 17 08 06 00 00 	movl   $0x6,0x8(%edi,%edx,1)
    50de:	00 
    50df:	51                   	push   %ecx
    50e0:	57                   	push   %edi
    50e1:	e8 5a d1 ff ff       	call   2240 <_ZNSolsEs@plt>
    50e6:	83 c4 0c             	add    $0xc,%esp
    50e9:	6a 03                	push   $0x3
    50eb:	ff 75 a4             	push   -0x5c(%ebp)
    50ee:	50                   	push   %eax
    50ef:	e8 ec d1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    50f4:	8b 45 a0             	mov    -0x60(%ebp),%eax
    50f7:	83 c4 10             	add    $0x10,%esp
    50fa:	39 45 9c             	cmp    %eax,-0x64(%ebp)
    50fd:	0f 85 48 ff ff ff    	jne    504b <.L147+0x1b>
    5103:	e9 cd fd ff ff       	jmp    4ed5 <.L139>
    5108:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    510f:	00 

00005110 <.L146>:
    5110:	8d 75 a8             	lea    -0x58(%ebp),%esi
    5113:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    5119:	c5 fd 7f 45 a8       	vmovdqa %ymm0,-0x58(%ebp)
    511e:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    5124:	89 75 9c             	mov    %esi,-0x64(%ebp)
    5127:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    512a:	8d 75 c7             	lea    -0x39(%ebp),%esi
    512d:	c5 f8 77             	vzeroupper
    5130:	8b 0f                	mov    (%edi),%ecx
    5132:	0f be 16             	movsbl (%esi),%edx
    5135:	83 ec 08             	sub    $0x8,%esp
    5138:	8b 41 f4             	mov    -0xc(%ecx),%eax
    513b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    5142:	00 
    5143:	52                   	push   %edx
    5144:	57                   	push   %edi
    5145:	e8 76 d2 ff ff       	call   23c0 <_ZNSolsEi@plt>
    514a:	83 c4 0c             	add    $0xc,%esp
    514d:	6a 03                	push   $0x3
    514f:	ff 75 a4             	push   -0x5c(%ebp)
    5152:	50                   	push   %eax
    5153:	e8 88 d1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5158:	8b 0f                	mov    (%edi),%ecx
    515a:	58                   	pop    %eax
    515b:	5a                   	pop    %edx
    515c:	0f be 56 ff          	movsbl -0x1(%esi),%edx
    5160:	8b 41 f4             	mov    -0xc(%ecx),%eax
    5163:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    516a:	00 
    516b:	52                   	push   %edx
    516c:	57                   	push   %edi
    516d:	e8 4e d2 ff ff       	call   23c0 <_ZNSolsEi@plt>
    5172:	83 c4 0c             	add    $0xc,%esp
    5175:	6a 03                	push   $0x3
    5177:	ff 75 a4             	push   -0x5c(%ebp)
    517a:	50                   	push   %eax
    517b:	e8 60 d1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5180:	59                   	pop    %ecx
    5181:	8b 0f                	mov    (%edi),%ecx
    5183:	0f be 56 fe          	movsbl -0x2(%esi),%edx
    5187:	58                   	pop    %eax
    5188:	8b 41 f4             	mov    -0xc(%ecx),%eax
    518b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    5192:	00 
    5193:	52                   	push   %edx
    5194:	57                   	push   %edi
    5195:	e8 26 d2 ff ff       	call   23c0 <_ZNSolsEi@plt>
    519a:	83 c4 0c             	add    $0xc,%esp
    519d:	6a 03                	push   $0x3
    519f:	ff 75 a4             	push   -0x5c(%ebp)
    51a2:	50                   	push   %eax
    51a3:	e8 38 d1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    51a8:	8d 4e fd             	lea    -0x3(%esi),%ecx
    51ab:	83 ee 04             	sub    $0x4,%esi
    51ae:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    51b1:	58                   	pop    %eax
    51b2:	8b 07                	mov    (%edi),%eax
    51b4:	5a                   	pop    %edx
    51b5:	0f be 4e 01          	movsbl 0x1(%esi),%ecx
    51b9:	8b 50 f4             	mov    -0xc(%eax),%edx
    51bc:	c7 44 17 08 03 00 00 	movl   $0x3,0x8(%edi,%edx,1)
    51c3:	00 
    51c4:	51                   	push   %ecx
    51c5:	57                   	push   %edi
    51c6:	e8 f5 d1 ff ff       	call   23c0 <_ZNSolsEi@plt>
    51cb:	83 c4 0c             	add    $0xc,%esp
    51ce:	6a 03                	push   $0x3
    51d0:	ff 75 a4             	push   -0x5c(%ebp)
    51d3:	50                   	push   %eax
    51d4:	e8 07 d1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    51d9:	8b 45 a0             	mov    -0x60(%ebp),%eax
    51dc:	83 c4 10             	add    $0x10,%esp
    51df:	39 45 9c             	cmp    %eax,-0x64(%ebp)
    51e2:	0f 85 48 ff ff ff    	jne    5130 <.L146+0x20>
    51e8:	e9 e8 fc ff ff       	jmp    4ed5 <.L139>
    51ed:	8d 76 00             	lea    0x0(%esi),%esi

000051f0 <.L145>:
    51f0:	8d 75 a8             	lea    -0x58(%ebp),%esi
    51f3:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    51f9:	c5 fd 7f 45 a8       	vmovdqa %ymm0,-0x58(%ebp)
    51fe:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    5204:	89 75 9c             	mov    %esi,-0x64(%ebp)
    5207:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    520a:	8d 75 c7             	lea    -0x39(%ebp),%esi
    520d:	c5 f8 77             	vzeroupper
    5210:	8b 0f                	mov    (%edi),%ecx
    5212:	0f b6 16             	movzbl (%esi),%edx
    5215:	83 ec 08             	sub    $0x8,%esp
    5218:	8b 41 f4             	mov    -0xc(%ecx),%eax
    521b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    5222:	00 
    5223:	52                   	push   %edx
    5224:	57                   	push   %edi
    5225:	e8 96 d1 ff ff       	call   23c0 <_ZNSolsEi@plt>
    522a:	83 c4 0c             	add    $0xc,%esp
    522d:	6a 03                	push   $0x3
    522f:	ff 75 a4             	push   -0x5c(%ebp)
    5232:	50                   	push   %eax
    5233:	e8 a8 d0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5238:	59                   	pop    %ecx
    5239:	8b 0f                	mov    (%edi),%ecx
    523b:	0f b6 56 ff          	movzbl -0x1(%esi),%edx
    523f:	58                   	pop    %eax
    5240:	8b 41 f4             	mov    -0xc(%ecx),%eax
    5243:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    524a:	00 
    524b:	52                   	push   %edx
    524c:	57                   	push   %edi
    524d:	e8 6e d1 ff ff       	call   23c0 <_ZNSolsEi@plt>
    5252:	83 c4 0c             	add    $0xc,%esp
    5255:	6a 03                	push   $0x3
    5257:	ff 75 a4             	push   -0x5c(%ebp)
    525a:	50                   	push   %eax
    525b:	e8 80 d0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5260:	8b 0f                	mov    (%edi),%ecx
    5262:	58                   	pop    %eax
    5263:	5a                   	pop    %edx
    5264:	0f b6 56 fe          	movzbl -0x2(%esi),%edx
    5268:	8b 41 f4             	mov    -0xc(%ecx),%eax
    526b:	c7 44 07 08 03 00 00 	movl   $0x3,0x8(%edi,%eax,1)
    5272:	00 
    5273:	52                   	push   %edx
    5274:	57                   	push   %edi
    5275:	e8 46 d1 ff ff       	call   23c0 <_ZNSolsEi@plt>
    527a:	83 c4 0c             	add    $0xc,%esp
    527d:	6a 03                	push   $0x3
    527f:	ff 75 a4             	push   -0x5c(%ebp)
    5282:	50                   	push   %eax
    5283:	e8 58 d0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5288:	8d 4e fd             	lea    -0x3(%esi),%ecx
    528b:	83 ee 04             	sub    $0x4,%esi
    528e:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    5291:	59                   	pop    %ecx
    5292:	58                   	pop    %eax
    5293:	8b 07                	mov    (%edi),%eax
    5295:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
    5299:	8b 50 f4             	mov    -0xc(%eax),%edx
    529c:	c7 44 17 08 03 00 00 	movl   $0x3,0x8(%edi,%edx,1)
    52a3:	00 
    52a4:	51                   	push   %ecx
    52a5:	57                   	push   %edi
    52a6:	e8 15 d1 ff ff       	call   23c0 <_ZNSolsEi@plt>
    52ab:	83 c4 0c             	add    $0xc,%esp
    52ae:	6a 03                	push   $0x3
    52b0:	ff 75 a4             	push   -0x5c(%ebp)
    52b3:	50                   	push   %eax
    52b4:	e8 27 d0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    52b9:	8b 45 a0             	mov    -0x60(%ebp),%eax
    52bc:	83 c4 10             	add    $0x10,%esp
    52bf:	39 45 9c             	cmp    %eax,-0x64(%ebp)
    52c2:	0f 85 48 ff ff ff    	jne    5210 <.L145+0x20>
    52c8:	e9 08 fc ff ff       	jmp    4ed5 <.L139>
    52cd:	8d 76 00             	lea    0x0(%esi),%esi

000052d0 <.L144>:
    52d0:	8d 75 a8             	lea    -0x58(%ebp),%esi
    52d3:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    52d9:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    52df:	89 75 9c             	mov    %esi,-0x64(%ebp)
    52e2:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    52e5:	8d 75 c6             	lea    -0x3a(%ebp),%esi
    52e8:	c5 f8 77             	vzeroupper
    52eb:	8b 0f                	mov    (%edi),%ecx
    52ed:	0f b7 16             	movzwl (%esi),%edx
    52f0:	83 ec 08             	sub    $0x8,%esp
    52f3:	8b 41 f4             	mov    -0xc(%ecx),%eax
    52f6:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    52fd:	00 
    52fe:	52                   	push   %edx
    52ff:	57                   	push   %edi
    5300:	e8 7b ce ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    5305:	83 c4 0c             	add    $0xc,%esp
    5308:	6a 03                	push   $0x3
    530a:	ff 75 a4             	push   -0x5c(%ebp)
    530d:	50                   	push   %eax
    530e:	e8 cd cf ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5313:	8b 0f                	mov    (%edi),%ecx
    5315:	58                   	pop    %eax
    5316:	5a                   	pop    %edx
    5317:	0f b7 56 fe          	movzwl -0x2(%esi),%edx
    531b:	8b 41 f4             	mov    -0xc(%ecx),%eax
    531e:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    5325:	00 
    5326:	52                   	push   %edx
    5327:	57                   	push   %edi
    5328:	e8 53 ce ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    532d:	83 c4 0c             	add    $0xc,%esp
    5330:	6a 03                	push   $0x3
    5332:	ff 75 a4             	push   -0x5c(%ebp)
    5335:	50                   	push   %eax
    5336:	e8 a5 cf ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    533b:	59                   	pop    %ecx
    533c:	8b 0f                	mov    (%edi),%ecx
    533e:	0f b7 56 fc          	movzwl -0x4(%esi),%edx
    5342:	58                   	pop    %eax
    5343:	8b 41 f4             	mov    -0xc(%ecx),%eax
    5346:	c7 44 07 08 06 00 00 	movl   $0x6,0x8(%edi,%eax,1)
    534d:	00 
    534e:	52                   	push   %edx
    534f:	57                   	push   %edi
    5350:	e8 2b ce ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    5355:	83 c4 0c             	add    $0xc,%esp
    5358:	6a 03                	push   $0x3
    535a:	ff 75 a4             	push   -0x5c(%ebp)
    535d:	50                   	push   %eax
    535e:	e8 7d cf ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5363:	8d 4e fa             	lea    -0x6(%esi),%ecx
    5366:	83 ee 08             	sub    $0x8,%esi
    5369:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    536c:	58                   	pop    %eax
    536d:	8b 07                	mov    (%edi),%eax
    536f:	5a                   	pop    %edx
    5370:	0f b7 4e 02          	movzwl 0x2(%esi),%ecx
    5374:	8b 50 f4             	mov    -0xc(%eax),%edx
    5377:	c7 44 17 08 06 00 00 	movl   $0x6,0x8(%edi,%edx,1)
    537e:	00 
    537f:	51                   	push   %ecx
    5380:	57                   	push   %edi
    5381:	e8 fa cd ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    5386:	83 c4 0c             	add    $0xc,%esp
    5389:	6a 03                	push   $0x3
    538b:	ff 75 a4             	push   -0x5c(%ebp)
    538e:	50                   	push   %eax
    538f:	e8 4c cf ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5394:	8b 45 a0             	mov    -0x60(%ebp),%eax
    5397:	83 c4 10             	add    $0x10,%esp
    539a:	39 45 9c             	cmp    %eax,-0x64(%ebp)
    539d:	0f 85 48 ff ff ff    	jne    52eb <.L144+0x1b>
    53a3:	e9 2d fb ff ff       	jmp    4ed5 <.L139>
    53a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    53af:	00 

000053b0 <.L143>:
    53b0:	8d 75 a8             	lea    -0x58(%ebp),%esi
    53b3:	8d 8b 7f c1 ff ff    	lea    -0x3e81(%ebx),%ecx
    53b9:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    53bf:	89 75 9c             	mov    %esi,-0x64(%ebp)
    53c2:	89 4d a4             	mov    %ecx,-0x5c(%ebp)
    53c5:	8d 75 c4             	lea    -0x3c(%ebp),%esi
    53c8:	c5 f8 77             	vzeroupper
    53cb:	8b 07                	mov    (%edi),%eax
    53cd:	83 ec 08             	sub    $0x8,%esp
    53d0:	8b 50 f4             	mov    -0xc(%eax),%edx
    53d3:	c7 44 17 08 0a 00 00 	movl   $0xa,0x8(%edi,%edx,1)
    53da:	00 
    53db:	ff 36                	push   (%esi)
    53dd:	57                   	push   %edi
    53de:	e8 9d cd ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    53e3:	83 c4 0c             	add    $0xc,%esp
    53e6:	6a 03                	push   $0x3
    53e8:	ff 75 a4             	push   -0x5c(%ebp)
    53eb:	50                   	push   %eax
    53ec:	e8 ef ce ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    53f1:	59                   	pop    %ecx
    53f2:	8b 0f                	mov    (%edi),%ecx
    53f4:	58                   	pop    %eax
    53f5:	8b 41 f4             	mov    -0xc(%ecx),%eax
    53f8:	c7 44 07 08 0a 00 00 	movl   $0xa,0x8(%edi,%eax,1)
    53ff:	00 
    5400:	ff 76 fc             	push   -0x4(%esi)
    5403:	57                   	push   %edi
    5404:	e8 77 cd ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    5409:	83 c4 0c             	add    $0xc,%esp
    540c:	6a 03                	push   $0x3
    540e:	ff 75 a4             	push   -0x5c(%ebp)
    5411:	50                   	push   %eax
    5412:	e8 c9 ce ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5417:	58                   	pop    %eax
    5418:	5a                   	pop    %edx
    5419:	8b 17                	mov    (%edi),%edx
    541b:	8b 4a f4             	mov    -0xc(%edx),%ecx
    541e:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    5425:	00 
    5426:	ff 76 f8             	push   -0x8(%esi)
    5429:	57                   	push   %edi
    542a:	e8 51 cd ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    542f:	83 c4 0c             	add    $0xc,%esp
    5432:	6a 03                	push   $0x3
    5434:	ff 75 a4             	push   -0x5c(%ebp)
    5437:	50                   	push   %eax
    5438:	e8 a3 ce ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    543d:	8b 17                	mov    (%edi),%edx
    543f:	8d 46 f4             	lea    -0xc(%esi),%eax
    5442:	83 ee 10             	sub    $0x10,%esi
    5445:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5448:	59                   	pop    %ecx
    5449:	58                   	pop    %eax
    544a:	8b 4a f4             	mov    -0xc(%edx),%ecx
    544d:	c7 44 0f 08 0a 00 00 	movl   $0xa,0x8(%edi,%ecx,1)
    5454:	00 
    5455:	ff 76 04             	push   0x4(%esi)
    5458:	57                   	push   %edi
    5459:	e8 22 cd ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    545e:	83 c4 0c             	add    $0xc,%esp
    5461:	6a 03                	push   $0x3
    5463:	ff 75 a4             	push   -0x5c(%ebp)
    5466:	50                   	push   %eax
    5467:	e8 74 ce ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    546c:	8b 45 a0             	mov    -0x60(%ebp),%eax
    546f:	83 c4 10             	add    $0x10,%esp
    5472:	39 45 9c             	cmp    %eax,-0x64(%ebp)
    5475:	0f 85 50 ff ff ff    	jne    53cb <.L143+0x1b>
    547b:	e9 55 fa ff ff       	jmp    4ed5 <.L139>
    5480:	c5 f8 77             	vzeroupper
    5483:	e8 18 55 00 00       	call   a9a0 <__stack_chk_fail_local>
    5488:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    548f:	00 

00005490 <_ZN2ez2ii10print_f256ERSoDv8_f>:
    5490:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    5494:	83 e4 e0             	and    $0xffffffe0,%esp
    5497:	ff 71 fc             	push   -0x4(%ecx)
    549a:	55                   	push   %ebp
    549b:	89 e5                	mov    %esp,%ebp
    549d:	57                   	push   %edi
    549e:	56                   	push   %esi
    549f:	53                   	push   %ebx
    54a0:	e8 8b e3 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    54a5:	81 c3 17 9a 00 00    	add    $0x9a17,%ebx
    54ab:	51                   	push   %ecx
    54ac:	8d 45 c8             	lea    -0x38(%ebp),%eax
    54af:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    54b5:	8d 7d e4             	lea    -0x1c(%ebp),%edi
    54b8:	83 ec 48             	sub    $0x48,%esp
    54bb:	c5 fc 29 45 c8       	vmovaps %ymm0,-0x38(%ebp)
    54c0:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    54c6:	89 45 bc             	mov    %eax,-0x44(%ebp)
    54c9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    54cc:	c5 f8 77             	vzeroupper
    54cf:	8b 0e                	mov    (%esi),%ecx
    54d1:	83 ec 0c             	sub    $0xc,%esp
    54d4:	d9 07                	flds   (%edi)
    54d6:	8b 51 f4             	mov    -0xc(%ecx),%edx
    54d9:	01 f2                	add    %esi,%edx
    54db:	8b 42 0c             	mov    0xc(%edx),%eax
    54de:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    54e3:	83 c8 04             	or     $0x4,%eax
    54e6:	89 42 0c             	mov    %eax,0xc(%edx)
    54e9:	dd 1c 24             	fstpl  (%esp)
    54ec:	56                   	push   %esi
    54ed:	e8 6e ce ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    54f2:	83 c4 0c             	add    $0xc,%esp
    54f5:	6a 03                	push   $0x3
    54f7:	ff 75 c4             	push   -0x3c(%ebp)
    54fa:	50                   	push   %eax
    54fb:	e8 e0 cd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5500:	8b 0e                	mov    (%esi),%ecx
    5502:	d9 47 fc             	flds   -0x4(%edi)
    5505:	8b 51 f4             	mov    -0xc(%ecx),%edx
    5508:	01 f2                	add    %esi,%edx
    550a:	8b 42 0c             	mov    0xc(%edx),%eax
    550d:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    5512:	83 c8 04             	or     $0x4,%eax
    5515:	89 42 0c             	mov    %eax,0xc(%edx)
    5518:	dd 5c 24 04          	fstpl  0x4(%esp)
    551c:	89 34 24             	mov    %esi,(%esp)
    551f:	e8 3c ce ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5524:	83 c4 0c             	add    $0xc,%esp
    5527:	6a 03                	push   $0x3
    5529:	ff 75 c4             	push   -0x3c(%ebp)
    552c:	50                   	push   %eax
    552d:	e8 ae cd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5532:	8b 0e                	mov    (%esi),%ecx
    5534:	d9 47 f8             	flds   -0x8(%edi)
    5537:	8b 51 f4             	mov    -0xc(%ecx),%edx
    553a:	01 f2                	add    %esi,%edx
    553c:	8b 42 0c             	mov    0xc(%edx),%eax
    553f:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    5544:	83 c8 04             	or     $0x4,%eax
    5547:	89 42 0c             	mov    %eax,0xc(%edx)
    554a:	dd 5c 24 04          	fstpl  0x4(%esp)
    554e:	89 34 24             	mov    %esi,(%esp)
    5551:	e8 0a ce ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5556:	83 c4 0c             	add    $0xc,%esp
    5559:	6a 03                	push   $0x3
    555b:	ff 75 c4             	push   -0x3c(%ebp)
    555e:	50                   	push   %eax
    555f:	e8 7c cd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5564:	8b 16                	mov    (%esi),%edx
    5566:	8d 4f f4             	lea    -0xc(%edi),%ecx
    5569:	d9 47 f4             	flds   -0xc(%edi)
    556c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
    556f:	83 ef 10             	sub    $0x10,%edi
    5572:	8b 4a f4             	mov    -0xc(%edx),%ecx
    5575:	01 f1                	add    %esi,%ecx
    5577:	8b 41 0c             	mov    0xc(%ecx),%eax
    557a:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    557f:	83 c8 04             	or     $0x4,%eax
    5582:	89 41 0c             	mov    %eax,0xc(%ecx)
    5585:	dd 5c 24 04          	fstpl  0x4(%esp)
    5589:	89 34 24             	mov    %esi,(%esp)
    558c:	e8 cf cd ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5591:	83 c4 0c             	add    $0xc,%esp
    5594:	6a 03                	push   $0x3
    5596:	ff 75 c4             	push   -0x3c(%ebp)
    5599:	50                   	push   %eax
    559a:	e8 41 cd ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    559f:	8b 55 c0             	mov    -0x40(%ebp),%edx
    55a2:	83 c4 10             	add    $0x10,%esp
    55a5:	39 55 bc             	cmp    %edx,-0x44(%ebp)
    55a8:	0f 85 21 ff ff ff    	jne    54cf <_ZN2ez2ii10print_f256ERSoDv8_f+0x3f>
    55ae:	8d 65 f0             	lea    -0x10(%ebp),%esp
    55b1:	59                   	pop    %ecx
    55b2:	5b                   	pop    %ebx
    55b3:	5e                   	pop    %esi
    55b4:	5f                   	pop    %edi
    55b5:	5d                   	pop    %ebp
    55b6:	8d 61 fc             	lea    -0x4(%ecx),%esp
    55b9:	c3                   	ret
    55ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000055c0 <_ZN2ez2ii10print_d256ERSoDv4_d>:
    55c0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    55c4:	83 e4 e0             	and    $0xffffffe0,%esp
    55c7:	ff 71 fc             	push   -0x4(%ecx)
    55ca:	55                   	push   %ebp
    55cb:	89 e5                	mov    %esp,%ebp
    55cd:	57                   	push   %edi
    55ce:	56                   	push   %esi
    55cf:	53                   	push   %ebx
    55d0:	e8 5b e2 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    55d5:	81 c3 e7 98 00 00    	add    $0x98e7,%ebx
    55db:	51                   	push   %ecx
    55dc:	8d 45 a8             	lea    -0x58(%ebp),%eax
    55df:	8d 93 7f c1 ff ff    	lea    -0x3e81(%ebx),%edx
    55e5:	8d 75 c8             	lea    -0x38(%ebp),%esi
    55e8:	83 ec 48             	sub    $0x48,%esp
    55eb:	c5 fd 29 45 c8       	vmovapd %ymm0,-0x38(%ebp)
    55f0:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    55f6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    55f9:	89 55 c0             	mov    %edx,-0x40(%ebp)
    55fc:	c5 f8 77             	vzeroupper
    55ff:	8b 0f                	mov    (%edi),%ecx
    5601:	83 ec 04             	sub    $0x4,%esp
    5604:	83 ee 08             	sub    $0x8,%esi
    5607:	8b 51 f4             	mov    -0xc(%ecx),%edx
    560a:	01 fa                	add    %edi,%edx
    560c:	8b 42 0c             	mov    0xc(%edx),%eax
    560f:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    5614:	83 c8 04             	or     $0x4,%eax
    5617:	89 42 0c             	mov    %eax,0xc(%edx)
    561a:	ff 76 24             	push   0x24(%esi)
    561d:	ff 76 20             	push   0x20(%esi)
    5620:	57                   	push   %edi
    5621:	e8 3a cd ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5626:	83 c4 0c             	add    $0xc,%esp
    5629:	6a 03                	push   $0x3
    562b:	ff 75 c0             	push   -0x40(%ebp)
    562e:	50                   	push   %eax
    562f:	e8 ac cc ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5634:	83 c4 10             	add    $0x10,%esp
    5637:	39 75 c4             	cmp    %esi,-0x3c(%ebp)
    563a:	75 c3                	jne    55ff <_ZN2ez2ii10print_d256ERSoDv4_d+0x3f>
    563c:	8d 65 f0             	lea    -0x10(%ebp),%esp
    563f:	59                   	pop    %ecx
    5640:	5b                   	pop    %ebx
    5641:	5e                   	pop    %esi
    5642:	5f                   	pop    %edi
    5643:	5d                   	pop    %ebp
    5644:	8d 61 fc             	lea    -0x4(%ecx),%esp
    5647:	c3                   	ret
    5648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    564f:	00 

00005650 <_ZN2ez2iilsERSoDv2_x>:
    5650:	53                   	push   %ebx
    5651:	83 ec 14             	sub    $0x14,%esp
    5654:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    5658:	53                   	push   %ebx
    5659:	e8 e2 e9 ff ff       	call   4040 <_ZN2ez2ii10print_i128ERSoDv2_x>
    565e:	83 c4 18             	add    $0x18,%esp
    5661:	89 d8                	mov    %ebx,%eax
    5663:	5b                   	pop    %ebx
    5664:	c3                   	ret
    5665:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    566c:	00 
    566d:	8d 76 00             	lea    0x0(%esi),%esi

00005670 <_ZN2ez2iilsERSoDv4_f>:
    5670:	55                   	push   %ebp
    5671:	57                   	push   %edi
    5672:	56                   	push   %esi
    5673:	53                   	push   %ebx
    5674:	e8 b7 e1 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    5679:	81 c3 43 98 00 00    	add    $0x9843,%ebx
    567f:	83 ec 3c             	sub    $0x3c,%esp
    5682:	8b ab 24 01 00 00    	mov    0x124(%ebx),%ebp
    5688:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    568e:	8b 44 24 50          	mov    0x50(%esp),%eax
    5692:	89 e2                	mov    %esp,%edx
    5694:	8d 74 24 10          	lea    0x10(%esp),%esi
    5698:	89 44 24 0c          	mov    %eax,0xc(%esp)
    569c:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    56a2:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    56a6:	31 c0                	xor    %eax,%eax
    56a8:	89 54 24 08          	mov    %edx,0x8(%esp)
    56ac:	c5 f8 29 44 24 10    	vmovaps %xmm0,0x10(%esp)
    56b2:	d9 46 0c             	flds   0xc(%esi)
    56b5:	8b 4d 00             	mov    0x0(%ebp),%ecx
    56b8:	83 ec 0c             	sub    $0xc,%esp
    56bb:	83 ee 04             	sub    $0x4,%esi
    56be:	8b 51 f4             	mov    -0xc(%ecx),%edx
    56c1:	01 ea                	add    %ebp,%edx
    56c3:	8b 42 0c             	mov    0xc(%edx),%eax
    56c6:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    56cb:	83 c8 04             	or     $0x4,%eax
    56ce:	89 42 0c             	mov    %eax,0xc(%edx)
    56d1:	dd 1c 24             	fstpl  (%esp)
    56d4:	55                   	push   %ebp
    56d5:	e8 86 cc ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    56da:	83 c4 0c             	add    $0xc,%esp
    56dd:	6a 03                	push   $0x3
    56df:	57                   	push   %edi
    56e0:	50                   	push   %eax
    56e1:	e8 fa cb ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    56e6:	83 c4 10             	add    $0x10,%esp
    56e9:	39 74 24 08          	cmp    %esi,0x8(%esp)
    56ed:	75 c3                	jne    56b2 <_ZN2ez2iilsERSoDv4_f+0x42>
    56ef:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    56f3:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    56fa:	75 0c                	jne    5708 <_ZN2ez2iilsERSoDv4_f+0x98>
    56fc:	8b 44 24 0c          	mov    0xc(%esp),%eax
    5700:	83 c4 3c             	add    $0x3c,%esp
    5703:	5b                   	pop    %ebx
    5704:	5e                   	pop    %esi
    5705:	5f                   	pop    %edi
    5706:	5d                   	pop    %ebp
    5707:	c3                   	ret
    5708:	e8 93 52 00 00       	call   a9a0 <__stack_chk_fail_local>
    570d:	8d 76 00             	lea    0x0(%esi),%esi

00005710 <_ZN2ez2iilsERSoDv2_d>:
    5710:	57                   	push   %edi
    5711:	56                   	push   %esi
    5712:	53                   	push   %ebx
    5713:	c5 f9 15 c8          	vunpckhpd %xmm0,%xmm0,%xmm1
    5717:	e8 14 e1 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    571c:	81 c3 a0 97 00 00    	add    $0x97a0,%ebx
    5722:	83 ec 1c             	sub    $0x1c,%esp
    5725:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    572b:	8d bb 7f c1 ff ff    	lea    -0x3e81(%ebx),%edi
    5731:	c5 f9 29 44 24 0c    	vmovapd %xmm0,0xc(%esp)
    5737:	8b 06                	mov    (%esi),%eax
    5739:	8b 50 f4             	mov    -0xc(%eax),%edx
    573c:	01 f2                	add    %esi,%edx
    573e:	8b 4a 0c             	mov    0xc(%edx),%ecx
    5741:	81 e1 fb fe ff ff    	and    $0xfffffefb,%ecx
    5747:	83 c9 04             	or     $0x4,%ecx
    574a:	89 4a 0c             	mov    %ecx,0xc(%edx)
    574d:	c5 fb 11 0c 24       	vmovsd %xmm1,(%esp)
    5752:	56                   	push   %esi
    5753:	e8 08 cc ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5758:	83 c4 0c             	add    $0xc,%esp
    575b:	6a 03                	push   $0x3
    575d:	57                   	push   %edi
    575e:	50                   	push   %eax
    575f:	e8 7c cb ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5764:	8b 06                	mov    (%esi),%eax
    5766:	c5 f9 28 44 24 10    	vmovapd 0x10(%esp),%xmm0
    576c:	8b 50 f4             	mov    -0xc(%eax),%edx
    576f:	01 f2                	add    %esi,%edx
    5771:	8b 4a 0c             	mov    0xc(%edx),%ecx
    5774:	81 e1 fb fe ff ff    	and    $0xfffffefb,%ecx
    577a:	83 c9 04             	or     $0x4,%ecx
    577d:	89 4a 0c             	mov    %ecx,0xc(%edx)
    5780:	c5 fb 11 44 24 04    	vmovsd %xmm0,0x4(%esp)
    5786:	89 34 24             	mov    %esi,(%esp)
    5789:	e8 d2 cb ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    578e:	83 c4 0c             	add    $0xc,%esp
    5791:	6a 03                	push   $0x3
    5793:	57                   	push   %edi
    5794:	50                   	push   %eax
    5795:	e8 46 cb ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    579a:	8b 44 24 30          	mov    0x30(%esp),%eax
    579e:	83 c4 20             	add    $0x20,%esp
    57a1:	5b                   	pop    %ebx
    57a2:	5e                   	pop    %esi
    57a3:	5f                   	pop    %edi
    57a4:	c3                   	ret
    57a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    57ac:	00 
    57ad:	8d 76 00             	lea    0x0(%esi),%esi

000057b0 <_ZN2ez2iilsERSoDv4_x>:
    57b0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    57b4:	83 e4 e0             	and    $0xffffffe0,%esp
    57b7:	ff 71 fc             	push   -0x4(%ecx)
    57ba:	55                   	push   %ebp
    57bb:	89 e5                	mov    %esp,%ebp
    57bd:	53                   	push   %ebx
    57be:	51                   	push   %ecx
    57bf:	83 ec 1c             	sub    $0x1c,%esp
    57c2:	8b 19                	mov    (%ecx),%ebx
    57c4:	53                   	push   %ebx
    57c5:	e8 66 f6 ff ff       	call   4e30 <_ZN2ez2ii10print_i256ERSoDv4_x>
    57ca:	83 c4 10             	add    $0x10,%esp
    57cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
    57d0:	89 d8                	mov    %ebx,%eax
    57d2:	59                   	pop    %ecx
    57d3:	5b                   	pop    %ebx
    57d4:	5d                   	pop    %ebp
    57d5:	8d 61 fc             	lea    -0x4(%ecx),%esp
    57d8:	c3                   	ret
    57d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000057e0 <_ZN2ez2iilsERSoDv8_f>:
    57e0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    57e4:	83 e4 e0             	and    $0xffffffe0,%esp
    57e7:	ff 71 fc             	push   -0x4(%ecx)
    57ea:	55                   	push   %ebp
    57eb:	89 e5                	mov    %esp,%ebp
    57ed:	57                   	push   %edi
    57ee:	56                   	push   %esi
    57ef:	53                   	push   %ebx
    57f0:	51                   	push   %ecx
    57f1:	8d 7d c4             	lea    -0x3c(%ebp),%edi
    57f4:	83 ec 68             	sub    $0x68,%esp
    57f7:	8b 11                	mov    (%ecx),%edx
    57f9:	e8 32 e0 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    57fe:	81 c3 be 96 00 00    	add    $0x96be,%ebx
    5804:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    580a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    580d:	31 c0                	xor    %eax,%eax
    580f:	89 55 98             	mov    %edx,-0x68(%ebp)
    5812:	c5 fc 29 45 a8       	vmovaps %ymm0,-0x58(%ebp)
    5817:	8d 45 a8             	lea    -0x58(%ebp),%eax
    581a:	8d 8b 7f c1 ff ff    	lea    -0x3e81(%ebx),%ecx
    5820:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    5826:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5829:	89 4d a4             	mov    %ecx,-0x5c(%ebp)
    582c:	c5 f8 77             	vzeroupper
    582f:	8b 16                	mov    (%esi),%edx
    5831:	83 ec 0c             	sub    $0xc,%esp
    5834:	d9 07                	flds   (%edi)
    5836:	8b 4a f4             	mov    -0xc(%edx),%ecx
    5839:	01 f1                	add    %esi,%ecx
    583b:	8b 41 0c             	mov    0xc(%ecx),%eax
    583e:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    5843:	83 c8 04             	or     $0x4,%eax
    5846:	89 41 0c             	mov    %eax,0xc(%ecx)
    5849:	dd 1c 24             	fstpl  (%esp)
    584c:	56                   	push   %esi
    584d:	e8 0e cb ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5852:	83 c4 0c             	add    $0xc,%esp
    5855:	6a 03                	push   $0x3
    5857:	ff 75 a4             	push   -0x5c(%ebp)
    585a:	50                   	push   %eax
    585b:	e8 80 ca ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5860:	8b 16                	mov    (%esi),%edx
    5862:	d9 47 fc             	flds   -0x4(%edi)
    5865:	8b 4a f4             	mov    -0xc(%edx),%ecx
    5868:	01 f1                	add    %esi,%ecx
    586a:	8b 41 0c             	mov    0xc(%ecx),%eax
    586d:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    5872:	83 c8 04             	or     $0x4,%eax
    5875:	89 41 0c             	mov    %eax,0xc(%ecx)
    5878:	dd 5c 24 04          	fstpl  0x4(%esp)
    587c:	89 34 24             	mov    %esi,(%esp)
    587f:	e8 dc ca ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    5884:	83 c4 0c             	add    $0xc,%esp
    5887:	6a 03                	push   $0x3
    5889:	ff 75 a4             	push   -0x5c(%ebp)
    588c:	50                   	push   %eax
    588d:	e8 4e ca ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5892:	8b 16                	mov    (%esi),%edx
    5894:	d9 47 f8             	flds   -0x8(%edi)
    5897:	8b 4a f4             	mov    -0xc(%edx),%ecx
    589a:	01 f1                	add    %esi,%ecx
    589c:	8b 41 0c             	mov    0xc(%ecx),%eax
    589f:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    58a4:	83 c8 04             	or     $0x4,%eax
    58a7:	89 41 0c             	mov    %eax,0xc(%ecx)
    58aa:	dd 5c 24 04          	fstpl  0x4(%esp)
    58ae:	89 34 24             	mov    %esi,(%esp)
    58b1:	e8 aa ca ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    58b6:	83 c4 0c             	add    $0xc,%esp
    58b9:	6a 03                	push   $0x3
    58bb:	ff 75 a4             	push   -0x5c(%ebp)
    58be:	50                   	push   %eax
    58bf:	e8 1c ca ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    58c4:	8b 0e                	mov    (%esi),%ecx
    58c6:	8d 57 f4             	lea    -0xc(%edi),%edx
    58c9:	d9 47 f4             	flds   -0xc(%edi)
    58cc:	89 55 a0             	mov    %edx,-0x60(%ebp)
    58cf:	83 ef 10             	sub    $0x10,%edi
    58d2:	8b 51 f4             	mov    -0xc(%ecx),%edx
    58d5:	01 f2                	add    %esi,%edx
    58d7:	8b 42 0c             	mov    0xc(%edx),%eax
    58da:	25 fb fe ff ff       	and    $0xfffffefb,%eax
    58df:	83 c8 04             	or     $0x4,%eax
    58e2:	89 42 0c             	mov    %eax,0xc(%edx)
    58e5:	dd 5c 24 04          	fstpl  0x4(%esp)
    58e9:	89 34 24             	mov    %esi,(%esp)
    58ec:	e8 6f ca ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    58f1:	83 c4 0c             	add    $0xc,%esp
    58f4:	6a 03                	push   $0x3
    58f6:	ff 75 a4             	push   -0x5c(%ebp)
    58f9:	50                   	push   %eax
    58fa:	e8 e1 c9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    58ff:	8b 4d a0             	mov    -0x60(%ebp),%ecx
    5902:	83 c4 10             	add    $0x10,%esp
    5905:	39 4d 9c             	cmp    %ecx,-0x64(%ebp)
    5908:	0f 85 21 ff ff ff    	jne    582f <_ZN2ez2iilsERSoDv8_f+0x4f>
    590e:	8b 5d 98             	mov    -0x68(%ebp),%ebx
    5911:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5914:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    591b:	75 0e                	jne    592b <_ZN2ez2iilsERSoDv8_f+0x14b>
    591d:	8d 65 f0             	lea    -0x10(%ebp),%esp
    5920:	89 d8                	mov    %ebx,%eax
    5922:	59                   	pop    %ecx
    5923:	5b                   	pop    %ebx
    5924:	5e                   	pop    %esi
    5925:	5f                   	pop    %edi
    5926:	5d                   	pop    %ebp
    5927:	8d 61 fc             	lea    -0x4(%ecx),%esp
    592a:	c3                   	ret
    592b:	e8 70 50 00 00       	call   a9a0 <__stack_chk_fail_local>

00005930 <_ZN2ez2iilsERSoDv4_d>:
    5930:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    5934:	83 e4 e0             	and    $0xffffffe0,%esp
    5937:	ff 71 fc             	push   -0x4(%ecx)
    593a:	55                   	push   %ebp
    593b:	89 e5                	mov    %esp,%ebp
    593d:	57                   	push   %edi
    593e:	56                   	push   %esi
    593f:	53                   	push   %ebx
    5940:	51                   	push   %ecx
    5941:	8d 55 88             	lea    -0x78(%ebp),%edx
    5944:	8d 75 a8             	lea    -0x58(%ebp),%esi
    5947:	83 ec 68             	sub    $0x68,%esp
    594a:	8b 01                	mov    (%ecx),%eax
    594c:	e8 df de ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    5951:	81 c3 6b 95 00 00    	add    $0x956b,%ebx
    5957:	89 45 9c             	mov    %eax,-0x64(%ebp)
    595a:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    5960:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5963:	31 c0                	xor    %eax,%eax
    5965:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    5968:	c5 fd 29 45 a8       	vmovapd %ymm0,-0x58(%ebp)
    596d:	8d 8b 7f c1 ff ff    	lea    -0x3e81(%ebx),%ecx
    5973:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    5979:	89 4d a0             	mov    %ecx,-0x60(%ebp)
    597c:	c5 f8 77             	vzeroupper
    597f:	8b 07                	mov    (%edi),%eax
    5981:	83 ec 04             	sub    $0x4,%esp
    5984:	83 ee 08             	sub    $0x8,%esi
    5987:	8b 50 f4             	mov    -0xc(%eax),%edx
    598a:	01 fa                	add    %edi,%edx
    598c:	8b 4a 0c             	mov    0xc(%edx),%ecx
    598f:	81 e1 fb fe ff ff    	and    $0xfffffefb,%ecx
    5995:	83 c9 04             	or     $0x4,%ecx
    5998:	89 4a 0c             	mov    %ecx,0xc(%edx)
    599b:	ff 76 24             	push   0x24(%esi)
    599e:	ff 76 20             	push   0x20(%esi)
    59a1:	57                   	push   %edi
    59a2:	e8 b9 c9 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    59a7:	83 c4 0c             	add    $0xc,%esp
    59aa:	6a 03                	push   $0x3
    59ac:	ff 75 a0             	push   -0x60(%ebp)
    59af:	50                   	push   %eax
    59b0:	e8 2b c9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    59b5:	83 c4 10             	add    $0x10,%esp
    59b8:	39 75 a4             	cmp    %esi,-0x5c(%ebp)
    59bb:	75 c2                	jne    597f <_ZN2ez2iilsERSoDv4_d+0x4f>
    59bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    59c0:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    59c7:	75 0f                	jne    59d8 <_ZN2ez2iilsERSoDv4_d+0xa8>
    59c9:	8b 45 9c             	mov    -0x64(%ebp),%eax
    59cc:	8d 65 f0             	lea    -0x10(%ebp),%esp
    59cf:	59                   	pop    %ecx
    59d0:	5b                   	pop    %ebx
    59d1:	5e                   	pop    %esi
    59d2:	5f                   	pop    %edi
    59d3:	5d                   	pop    %ebp
    59d4:	8d 61 fc             	lea    -0x4(%ecx),%esp
    59d7:	c3                   	ret
    59d8:	e8 c3 4f 00 00       	call   a9a0 <__stack_chk_fail_local>

000059dd <__x86.get_pc_thunk.ax>:
    59dd:	8b 04 24             	mov    (%esp),%eax
    59e0:	c3                   	ret
    59e1:	66 90                	xchg   %ax,%ax
    59e3:	66 90                	xchg   %ax,%ax
    59e5:	66 90                	xchg   %ax,%ax
    59e7:	66 90                	xchg   %ax,%ax
    59e9:	66 90                	xchg   %ax,%ax
    59eb:	66 90                	xchg   %ax,%ax
    59ed:	66 90                	xchg   %ax,%ax
    59ef:	90                   	nop

000059f0 <_Z9draw_hzlni>:
    59f0:	55                   	push   %ebp
    59f1:	57                   	push   %edi
    59f2:	56                   	push   %esi
    59f3:	53                   	push   %ebx
    59f4:	83 ec 0c             	sub    $0xc,%esp
    59f7:	8b 44 24 20          	mov    0x20(%esp),%eax
    59fb:	e8 30 de ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    5a00:	81 c3 bc 94 00 00    	add    $0x94bc,%ebx
    5a06:	85 c0                	test   %eax,%eax
    5a08:	0f 8e 53 01 00 00    	jle    5b61 <_Z9draw_hzlni+0x171>
    5a0e:	8b 54 24 20          	mov    0x20(%esp),%edx
    5a12:	31 ed                	xor    %ebp,%ebp
    5a14:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    5a1a:	8d 35 d8 02 00 00    	lea    0x2d8,%esi
    5a20:	83 e2 07             	and    $0x7,%edx
    5a23:	0f 84 a8 00 00 00    	je     5ad1 <_Z9draw_hzlni+0xe1>
    5a29:	83 fa 01             	cmp    $0x1,%edx
    5a2c:	0f 84 81 00 00 00    	je     5ab3 <_Z9draw_hzlni+0xc3>
    5a32:	83 fa 02             	cmp    $0x2,%edx
    5a35:	74 68                	je     5a9f <_Z9draw_hzlni+0xaf>
    5a37:	83 fa 03             	cmp    $0x3,%edx
    5a3a:	74 4f                	je     5a8b <_Z9draw_hzlni+0x9b>
    5a3c:	83 fa 04             	cmp    $0x4,%edx
    5a3f:	74 36                	je     5a77 <_Z9draw_hzlni+0x87>
    5a41:	83 fa 05             	cmp    $0x5,%edx
    5a44:	74 1d                	je     5a63 <_Z9draw_hzlni+0x73>
    5a46:	83 fa 06             	cmp    $0x6,%edx
    5a49:	0f 85 21 01 00 00    	jne    5b70 <_Z9draw_hzlni+0x180>
    5a4f:	83 ec 04             	sub    $0x4,%esp
    5a52:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5a56:	ff 34 1e             	push   (%esi,%ebx,1)
    5a59:	45                   	inc    %ebp
    5a5a:	57                   	push   %edi
    5a5b:	e8 80 c8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5a60:	83 c4 10             	add    $0x10,%esp
    5a63:	83 ec 04             	sub    $0x4,%esp
    5a66:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5a6a:	ff 34 1e             	push   (%esi,%ebx,1)
    5a6d:	45                   	inc    %ebp
    5a6e:	57                   	push   %edi
    5a6f:	e8 6c c8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5a74:	83 c4 10             	add    $0x10,%esp
    5a77:	83 ec 04             	sub    $0x4,%esp
    5a7a:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5a7e:	ff 34 1e             	push   (%esi,%ebx,1)
    5a81:	45                   	inc    %ebp
    5a82:	57                   	push   %edi
    5a83:	e8 58 c8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5a88:	83 c4 10             	add    $0x10,%esp
    5a8b:	83 ec 04             	sub    $0x4,%esp
    5a8e:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5a92:	ff 34 1e             	push   (%esi,%ebx,1)
    5a95:	45                   	inc    %ebp
    5a96:	57                   	push   %edi
    5a97:	e8 44 c8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5a9c:	83 c4 10             	add    $0x10,%esp
    5a9f:	83 ec 04             	sub    $0x4,%esp
    5aa2:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5aa6:	ff 34 1e             	push   (%esi,%ebx,1)
    5aa9:	45                   	inc    %ebp
    5aaa:	57                   	push   %edi
    5aab:	e8 30 c8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5ab0:	83 c4 10             	add    $0x10,%esp
    5ab3:	83 ec 04             	sub    $0x4,%esp
    5ab6:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5aba:	ff 34 1e             	push   (%esi,%ebx,1)
    5abd:	45                   	inc    %ebp
    5abe:	57                   	push   %edi
    5abf:	e8 1c c8 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5ac4:	83 c4 10             	add    $0x10,%esp
    5ac7:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
    5acb:	0f 84 90 00 00 00    	je     5b61 <_Z9draw_hzlni+0x171>
    5ad1:	83 ec 04             	sub    $0x4,%esp
    5ad4:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5ad8:	ff 34 1e             	push   (%esi,%ebx,1)
    5adb:	83 c5 08             	add    $0x8,%ebp
    5ade:	57                   	push   %edi
    5adf:	e8 fc c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5ae4:	83 c4 0c             	add    $0xc,%esp
    5ae7:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5aeb:	ff 34 1e             	push   (%esi,%ebx,1)
    5aee:	57                   	push   %edi
    5aef:	e8 ec c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5af4:	83 c4 0c             	add    $0xc,%esp
    5af7:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5afb:	ff 34 1e             	push   (%esi,%ebx,1)
    5afe:	57                   	push   %edi
    5aff:	e8 dc c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b04:	83 c4 0c             	add    $0xc,%esp
    5b07:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5b0b:	ff 34 1e             	push   (%esi,%ebx,1)
    5b0e:	57                   	push   %edi
    5b0f:	e8 cc c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b14:	83 c4 0c             	add    $0xc,%esp
    5b17:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5b1b:	ff 34 1e             	push   (%esi,%ebx,1)
    5b1e:	57                   	push   %edi
    5b1f:	e8 bc c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b24:	83 c4 0c             	add    $0xc,%esp
    5b27:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5b2b:	ff 34 1e             	push   (%esi,%ebx,1)
    5b2e:	57                   	push   %edi
    5b2f:	e8 ac c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b34:	83 c4 0c             	add    $0xc,%esp
    5b37:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5b3b:	ff 34 1e             	push   (%esi,%ebx,1)
    5b3e:	57                   	push   %edi
    5b3f:	e8 9c c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b44:	83 c4 0c             	add    $0xc,%esp
    5b47:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5b4b:	ff 34 1e             	push   (%esi,%ebx,1)
    5b4e:	57                   	push   %edi
    5b4f:	e8 8c c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b54:	83 c4 10             	add    $0x10,%esp
    5b57:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
    5b5b:	0f 85 70 ff ff ff    	jne    5ad1 <_Z9draw_hzlni+0xe1>
    5b61:	83 c4 0c             	add    $0xc,%esp
    5b64:	5b                   	pop    %ebx
    5b65:	5e                   	pop    %esi
    5b66:	5f                   	pop    %edi
    5b67:	5d                   	pop    %ebp
    5b68:	c3                   	ret
    5b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    5b70:	83 ec 04             	sub    $0x4,%esp
    5b73:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5b77:	ff 34 1e             	push   (%esi,%ebx,1)
    5b7a:	bd 01 00 00 00       	mov    $0x1,%ebp
    5b7f:	57                   	push   %edi
    5b80:	e8 5b c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5b85:	83 c4 10             	add    $0x10,%esp
    5b88:	e9 c2 fe ff ff       	jmp    5a4f <_Z9draw_hzlni+0x5f>
    5b8d:	8d 76 00             	lea    0x0(%esi),%esi

00005b90 <_Z8draw_ulnv>:
    5b90:	55                   	push   %ebp
    5b91:	57                   	push   %edi
    5b92:	56                   	push   %esi
    5b93:	bd 46 00 00 00       	mov    $0x46,%ebp
    5b98:	53                   	push   %ebx
    5b99:	8d 35 d8 02 00 00    	lea    0x2d8,%esi
    5b9f:	e8 8c dc ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    5ba4:	81 c3 18 93 00 00    	add    $0x9318,%ebx
    5baa:	83 ec 10             	sub    $0x10,%esp
    5bad:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    5bb3:	8d 83 83 c1 ff ff    	lea    -0x3e7d(%ebx),%eax
    5bb9:	6a 04                	push   $0x4
    5bbb:	50                   	push   %eax
    5bbc:	57                   	push   %edi
    5bbd:	e8 1e c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5bc2:	83 c4 0c             	add    $0xc,%esp
    5bc5:	ff b3 3c 03 00 00    	push   0x33c(%ebx)
    5bcb:	ff b3 38 03 00 00    	push   0x338(%ebx)
    5bd1:	57                   	push   %edi
    5bd2:	e8 09 c7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5bd7:	83 c4 10             	add    $0x10,%esp
    5bda:	83 ec 04             	sub    $0x4,%esp
    5bdd:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5be1:	ff 34 1e             	push   (%esi,%ebx,1)
    5be4:	57                   	push   %edi
    5be5:	e8 f6 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5bea:	83 c4 0c             	add    $0xc,%esp
    5bed:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5bf1:	ff 34 1e             	push   (%esi,%ebx,1)
    5bf4:	57                   	push   %edi
    5bf5:	e8 e6 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5bfa:	83 c4 0c             	add    $0xc,%esp
    5bfd:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c01:	ff 34 1e             	push   (%esi,%ebx,1)
    5c04:	57                   	push   %edi
    5c05:	e8 d6 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c0a:	83 c4 0c             	add    $0xc,%esp
    5c0d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c11:	ff 34 1e             	push   (%esi,%ebx,1)
    5c14:	57                   	push   %edi
    5c15:	e8 c6 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c1a:	83 c4 0c             	add    $0xc,%esp
    5c1d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c21:	ff 34 1e             	push   (%esi,%ebx,1)
    5c24:	57                   	push   %edi
    5c25:	e8 b6 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c2a:	83 c4 0c             	add    $0xc,%esp
    5c2d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c31:	ff 34 1e             	push   (%esi,%ebx,1)
    5c34:	57                   	push   %edi
    5c35:	e8 a6 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c3a:	83 c4 0c             	add    $0xc,%esp
    5c3d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c41:	ff 34 1e             	push   (%esi,%ebx,1)
    5c44:	57                   	push   %edi
    5c45:	e8 96 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c4a:	83 c4 0c             	add    $0xc,%esp
    5c4d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c51:	ff 34 1e             	push   (%esi,%ebx,1)
    5c54:	57                   	push   %edi
    5c55:	e8 86 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c5a:	83 c4 0c             	add    $0xc,%esp
    5c5d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c61:	ff 34 1e             	push   (%esi,%ebx,1)
    5c64:	57                   	push   %edi
    5c65:	e8 76 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c6a:	83 c4 0c             	add    $0xc,%esp
    5c6d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5c71:	ff 34 1e             	push   (%esi,%ebx,1)
    5c74:	57                   	push   %edi
    5c75:	e8 66 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c7a:	83 c4 10             	add    $0x10,%esp
    5c7d:	83 ed 0a             	sub    $0xa,%ebp
    5c80:	0f 85 54 ff ff ff    	jne    5bda <_Z8draw_ulnv+0x4a>
    5c86:	83 ec 04             	sub    $0x4,%esp
    5c89:	ff b3 24 03 00 00    	push   0x324(%ebx)
    5c8f:	ff b3 20 03 00 00    	push   0x320(%ebx)
    5c95:	57                   	push   %edi
    5c96:	e8 45 c6 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5c9b:	83 c4 10             	add    $0x10,%esp
    5c9e:	8b 10                	mov    (%eax),%edx
    5ca0:	89 c5                	mov    %eax,%ebp
    5ca2:	8b 4a f4             	mov    -0xc(%edx),%ecx
    5ca5:	8b 7c 08 7c          	mov    0x7c(%eax,%ecx,1),%edi
    5ca9:	85 ff                	test   %edi,%edi
    5cab:	74 63                	je     5d10 <_Z8draw_ulnv+0x180>
    5cad:	80 7f 1c 00          	cmpb   $0x0,0x1c(%edi)
    5cb1:	74 2d                	je     5ce0 <_Z8draw_ulnv+0x150>
    5cb3:	0f be 4f 27          	movsbl 0x27(%edi),%ecx
    5cb7:	83 ec 08             	sub    $0x8,%esp
    5cba:	51                   	push   %ecx
    5cbb:	55                   	push   %ebp
    5cbc:	e8 7f c3 ff ff       	call   2040 <_ZNSo3putEc@plt>
    5cc1:	89 04 24             	mov    %eax,(%esp)
    5cc4:	e8 c7 c4 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    5cc9:	83 c4 1c             	add    $0x1c,%esp
    5ccc:	5b                   	pop    %ebx
    5ccd:	5e                   	pop    %esi
    5cce:	5f                   	pop    %edi
    5ccf:	5d                   	pop    %ebp
    5cd0:	c3                   	ret
    5cd1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    5cd8:	00 
    5cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    5ce0:	83 ec 0c             	sub    $0xc,%esp
    5ce3:	57                   	push   %edi
    5ce4:	e8 b7 c5 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    5ce9:	8b 07                	mov    (%edi),%eax
    5ceb:	8d 93 74 74 ff ff    	lea    -0x8b8c(%ebx),%edx
    5cf1:	83 c4 10             	add    $0x10,%esp
    5cf4:	b9 0a 00 00 00       	mov    $0xa,%ecx
    5cf9:	8b 70 18             	mov    0x18(%eax),%esi
    5cfc:	39 d6                	cmp    %edx,%esi
    5cfe:	74 b7                	je     5cb7 <_Z8draw_ulnv+0x127>
    5d00:	83 ec 08             	sub    $0x8,%esp
    5d03:	6a 0a                	push   $0xa
    5d05:	57                   	push   %edi
    5d06:	ff d6                	call   *%esi
    5d08:	0f be c8             	movsbl %al,%ecx
    5d0b:	83 c4 10             	add    $0x10,%esp
    5d0e:	eb a7                	jmp    5cb7 <_Z8draw_ulnv+0x127>
    5d10:	e8 bb c5 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    5d15:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    5d1c:	00 
    5d1d:	8d 76 00             	lea    0x0(%esi),%esi

00005d20 <_Z8draw_blnv>:
    5d20:	55                   	push   %ebp
    5d21:	57                   	push   %edi
    5d22:	56                   	push   %esi
    5d23:	bd 46 00 00 00       	mov    $0x46,%ebp
    5d28:	53                   	push   %ebx
    5d29:	8d 35 d8 02 00 00    	lea    0x2d8,%esi
    5d2f:	e8 fc da ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    5d34:	81 c3 88 91 00 00    	add    $0x9188,%ebx
    5d3a:	83 ec 10             	sub    $0x10,%esp
    5d3d:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    5d43:	8d 83 83 c1 ff ff    	lea    -0x3e7d(%ebx),%eax
    5d49:	6a 04                	push   $0x4
    5d4b:	50                   	push   %eax
    5d4c:	57                   	push   %edi
    5d4d:	e8 8e c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5d52:	83 c4 0c             	add    $0xc,%esp
    5d55:	ff b3 0c 03 00 00    	push   0x30c(%ebx)
    5d5b:	ff b3 08 03 00 00    	push   0x308(%ebx)
    5d61:	57                   	push   %edi
    5d62:	e8 79 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5d67:	83 c4 10             	add    $0x10,%esp
    5d6a:	83 ec 04             	sub    $0x4,%esp
    5d6d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5d71:	ff 34 1e             	push   (%esi,%ebx,1)
    5d74:	57                   	push   %edi
    5d75:	e8 66 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5d7a:	83 c4 0c             	add    $0xc,%esp
    5d7d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5d81:	ff 34 1e             	push   (%esi,%ebx,1)
    5d84:	57                   	push   %edi
    5d85:	e8 56 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5d8a:	83 c4 0c             	add    $0xc,%esp
    5d8d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5d91:	ff 34 1e             	push   (%esi,%ebx,1)
    5d94:	57                   	push   %edi
    5d95:	e8 46 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5d9a:	83 c4 0c             	add    $0xc,%esp
    5d9d:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5da1:	ff 34 1e             	push   (%esi,%ebx,1)
    5da4:	57                   	push   %edi
    5da5:	e8 36 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5daa:	83 c4 0c             	add    $0xc,%esp
    5dad:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5db1:	ff 34 1e             	push   (%esi,%ebx,1)
    5db4:	57                   	push   %edi
    5db5:	e8 26 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5dba:	83 c4 0c             	add    $0xc,%esp
    5dbd:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5dc1:	ff 34 1e             	push   (%esi,%ebx,1)
    5dc4:	57                   	push   %edi
    5dc5:	e8 16 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5dca:	83 c4 0c             	add    $0xc,%esp
    5dcd:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5dd1:	ff 34 1e             	push   (%esi,%ebx,1)
    5dd4:	57                   	push   %edi
    5dd5:	e8 06 c5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5dda:	83 c4 0c             	add    $0xc,%esp
    5ddd:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5de1:	ff 34 1e             	push   (%esi,%ebx,1)
    5de4:	57                   	push   %edi
    5de5:	e8 f6 c4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5dea:	83 c4 0c             	add    $0xc,%esp
    5ded:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5df1:	ff 34 1e             	push   (%esi,%ebx,1)
    5df4:	57                   	push   %edi
    5df5:	e8 e6 c4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5dfa:	83 c4 0c             	add    $0xc,%esp
    5dfd:	ff 74 1e 04          	push   0x4(%esi,%ebx,1)
    5e01:	ff 34 1e             	push   (%esi,%ebx,1)
    5e04:	57                   	push   %edi
    5e05:	e8 d6 c4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5e0a:	83 c4 10             	add    $0x10,%esp
    5e0d:	83 ed 0a             	sub    $0xa,%ebp
    5e10:	0f 85 54 ff ff ff    	jne    5d6a <_Z8draw_blnv+0x4a>
    5e16:	83 ec 04             	sub    $0x4,%esp
    5e19:	ff b3 f4 02 00 00    	push   0x2f4(%ebx)
    5e1f:	ff b3 f0 02 00 00    	push   0x2f0(%ebx)
    5e25:	57                   	push   %edi
    5e26:	e8 b5 c4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5e2b:	83 c4 10             	add    $0x10,%esp
    5e2e:	8b 10                	mov    (%eax),%edx
    5e30:	89 c5                	mov    %eax,%ebp
    5e32:	8b 4a f4             	mov    -0xc(%edx),%ecx
    5e35:	8b 7c 08 7c          	mov    0x7c(%eax,%ecx,1),%edi
    5e39:	85 ff                	test   %edi,%edi
    5e3b:	74 63                	je     5ea0 <_Z8draw_blnv+0x180>
    5e3d:	80 7f 1c 00          	cmpb   $0x0,0x1c(%edi)
    5e41:	74 2d                	je     5e70 <_Z8draw_blnv+0x150>
    5e43:	0f be 4f 27          	movsbl 0x27(%edi),%ecx
    5e47:	83 ec 08             	sub    $0x8,%esp
    5e4a:	51                   	push   %ecx
    5e4b:	55                   	push   %ebp
    5e4c:	e8 ef c1 ff ff       	call   2040 <_ZNSo3putEc@plt>
    5e51:	89 04 24             	mov    %eax,(%esp)
    5e54:	e8 37 c3 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    5e59:	83 c4 1c             	add    $0x1c,%esp
    5e5c:	5b                   	pop    %ebx
    5e5d:	5e                   	pop    %esi
    5e5e:	5f                   	pop    %edi
    5e5f:	5d                   	pop    %ebp
    5e60:	c3                   	ret
    5e61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    5e68:	00 
    5e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    5e70:	83 ec 0c             	sub    $0xc,%esp
    5e73:	57                   	push   %edi
    5e74:	e8 27 c4 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    5e79:	8b 07                	mov    (%edi),%eax
    5e7b:	8d 93 74 74 ff ff    	lea    -0x8b8c(%ebx),%edx
    5e81:	83 c4 10             	add    $0x10,%esp
    5e84:	b9 0a 00 00 00       	mov    $0xa,%ecx
    5e89:	8b 70 18             	mov    0x18(%eax),%esi
    5e8c:	39 d6                	cmp    %edx,%esi
    5e8e:	74 b7                	je     5e47 <_Z8draw_blnv+0x127>
    5e90:	83 ec 08             	sub    $0x8,%esp
    5e93:	6a 0a                	push   $0xa
    5e95:	57                   	push   %edi
    5e96:	ff d6                	call   *%esi
    5e98:	0f be c8             	movsbl %al,%ecx
    5e9b:	83 c4 10             	add    $0x10,%esp
    5e9e:	eb a7                	jmp    5e47 <_Z8draw_blnv+0x127>
    5ea0:	e8 2b c4 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    5ea5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    5eac:	00 
    5ead:	8d 76 00             	lea    0x0(%esi),%esi

00005eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    5eb0:	55                   	push   %ebp
    5eb1:	89 e5                	mov    %esp,%ebp
    5eb3:	57                   	push   %edi
    5eb4:	56                   	push   %esi
    5eb5:	53                   	push   %ebx
    5eb6:	83 ec 70             	sub    $0x70,%esp
    5eb9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5ebc:	bf 46 00 00 00       	mov    $0x46,%edi
    5ec1:	8d 55 b4             	lea    -0x4c(%ebp),%edx
    5ec4:	8d 5d bc             	lea    -0x44(%ebp),%ebx
    5ec7:	e8 a4 08 00 00       	call   6770 <__x86.get_pc_thunk.si>
    5ecc:	81 c6 f0 8f 00 00    	add    $0x8ff0,%esi
    5ed2:	2b 79 04             	sub    0x4(%ecx),%edi
    5ed5:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    5edb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5ede:	31 c0                	xor    %eax,%eax
    5ee0:	89 4d a4             	mov    %ecx,-0x5c(%ebp)
    5ee3:	89 5d a0             	mov    %ebx,-0x60(%ebp)
    5ee6:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
    5ee9:	89 55 94             	mov    %edx,-0x6c(%ebp)
    5eec:	89 f8                	mov    %edi,%eax
    5eee:	6a 20                	push   $0x20
    5ef0:	89 f3                	mov    %esi,%ebx
    5ef2:	d1 e8                	shr    $1,%eax
    5ef4:	50                   	push   %eax
    5ef5:	52                   	push   %edx
    5ef6:	29 c7                	sub    %eax,%edi
    5ef8:	e8 73 c3 ff ff       	call   2270 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEjc@plt>
    5efd:	83 c4 0c             	add    $0xc,%esp
    5f00:	8d 4d cc             	lea    -0x34(%ebp),%ecx
    5f03:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    5f06:	89 4d 98             	mov    %ecx,-0x68(%ebp)
    5f09:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5f0c:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5f0f:	6a 20                	push   $0x20
    5f11:	57                   	push   %edi
    5f12:	51                   	push   %ecx
    5f13:	e8 58 c3 ff ff       	call   2270 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructEjc@plt>
    5f18:	83 c4 0c             	add    $0xc,%esp
    5f1b:	8d be 83 c1 ff ff    	lea    -0x3e7d(%esi),%edi
    5f21:	6a 04                	push   $0x4
    5f23:	57                   	push   %edi
    5f24:	8b be 24 01 00 00    	mov    0x124(%esi),%edi
    5f2a:	57                   	push   %edi
    5f2b:	e8 b0 c3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5f30:	83 c4 0c             	add    $0xc,%esp
    5f33:	ff b6 c4 02 00 00    	push   0x2c4(%esi)
    5f39:	ff b6 c0 02 00 00    	push   0x2c0(%esi)
    5f3f:	57                   	push   %edi
    5f40:	e8 9b c3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5f45:	83 c4 0c             	add    $0xc,%esp
    5f48:	ff 75 b8             	push   -0x48(%ebp)
    5f4b:	ff 75 b4             	push   -0x4c(%ebp)
    5f4e:	50                   	push   %eax
    5f4f:	e8 8c c3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5f54:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    5f57:	83 c4 0c             	add    $0xc,%esp
    5f5a:	ff 72 04             	push   0x4(%edx)
    5f5d:	ff 32                	push   (%edx)
    5f5f:	50                   	push   %eax
    5f60:	e8 7b c3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5f65:	83 c4 0c             	add    $0xc,%esp
    5f68:	ff 75 d0             	push   -0x30(%ebp)
    5f6b:	ff 75 cc             	push   -0x34(%ebp)
    5f6e:	50                   	push   %eax
    5f6f:	e8 6c c3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5f74:	83 c4 0c             	add    $0xc,%esp
    5f77:	ff b6 c4 02 00 00    	push   0x2c4(%esi)
    5f7d:	ff b6 c0 02 00 00    	push   0x2c0(%esi)
    5f83:	50                   	push   %eax
    5f84:	e8 57 c3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    5f89:	8b 18                	mov    (%eax),%ebx
    5f8b:	89 c7                	mov    %eax,%edi
    5f8d:	83 c4 10             	add    $0x10,%esp
    5f90:	8b 4b f4             	mov    -0xc(%ebx),%ecx
    5f93:	8b 44 08 7c          	mov    0x7c(%eax,%ecx,1),%eax
    5f97:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    5f9a:	85 c0                	test   %eax,%eax
    5f9c:	0f 84 b3 00 00 00    	je     6055 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1a5>
    5fa2:	80 78 1c 00          	cmpb   $0x0,0x1c(%eax)
    5fa6:	74 68                	je     6010 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x160>
    5fa8:	0f be 40 27          	movsbl 0x27(%eax),%eax
    5fac:	83 ec 08             	sub    $0x8,%esp
    5faf:	89 f3                	mov    %esi,%ebx
    5fb1:	50                   	push   %eax
    5fb2:	57                   	push   %edi
    5fb3:	e8 88 c0 ff ff       	call   2040 <_ZNSo3putEc@plt>
    5fb8:	89 04 24             	mov    %eax,(%esp)
    5fbb:	e8 d0 c1 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    5fc0:	8b 7d cc             	mov    -0x34(%ebp),%edi
    5fc3:	8b 55 9c             	mov    -0x64(%ebp),%edx
    5fc6:	83 c4 10             	add    $0x10,%esp
    5fc9:	39 d7                	cmp    %edx,%edi
    5fcb:	74 0c                	je     5fd9 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x129>
    5fcd:	83 ec 0c             	sub    $0xc,%esp
    5fd0:	57                   	push   %edi
    5fd1:	e8 7a c2 ff ff       	call   2250 <_ZdlPv@plt>
    5fd6:	83 c4 10             	add    $0x10,%esp
    5fd9:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    5fdc:	8b 4d a0             	mov    -0x60(%ebp),%ecx
    5fdf:	39 cb                	cmp    %ecx,%ebx
    5fe1:	74 0e                	je     5ff1 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x141>
    5fe3:	83 ec 0c             	sub    $0xc,%esp
    5fe6:	53                   	push   %ebx
    5fe7:	89 f3                	mov    %esi,%ebx
    5fe9:	e8 62 c2 ff ff       	call   2250 <_ZdlPv@plt>
    5fee:	83 c4 10             	add    $0x10,%esp
    5ff1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ff4:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    5ffb:	75 53                	jne    6050 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1a0>
    5ffd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    6000:	5b                   	pop    %ebx
    6001:	5e                   	pop    %esi
    6002:	5f                   	pop    %edi
    6003:	5d                   	pop    %ebp
    6004:	c3                   	ret
    6005:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    600c:	00 
    600d:	8d 76 00             	lea    0x0(%esi),%esi
    6010:	83 ec 0c             	sub    $0xc,%esp
    6013:	ff 75 a4             	push   -0x5c(%ebp)
    6016:	89 f3                	mov    %esi,%ebx
    6018:	e8 83 c2 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    601d:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    6020:	8d 8e 74 74 ff ff    	lea    -0x8b8c(%esi),%ecx
    6026:	83 c4 10             	add    $0x10,%esp
    6029:	b8 0a 00 00 00       	mov    $0xa,%eax
    602e:	8b 1a                	mov    (%edx),%ebx
    6030:	8b 53 18             	mov    0x18(%ebx),%edx
    6033:	39 ca                	cmp    %ecx,%edx
    6035:	0f 84 71 ff ff ff    	je     5fac <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xfc>
    603b:	83 ec 08             	sub    $0x8,%esp
    603e:	6a 0a                	push   $0xa
    6040:	ff 75 a4             	push   -0x5c(%ebp)
    6043:	ff d2                	call   *%edx
    6045:	83 c4 10             	add    $0x10,%esp
    6048:	0f be c0             	movsbl %al,%eax
    604b:	e9 5c ff ff ff       	jmp    5fac <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xfc>
    6050:	e8 4b 49 00 00       	call   a9a0 <__stack_chk_fail_local>
    6055:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6058:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    605f:	75 ef                	jne    6050 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1a0>
    6061:	89 f3                	mov    %esi,%ebx
    6063:	e8 68 c2 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    6068:	89 c7                	mov    %eax,%edi
    606a:	e9 49 c4 ff ff       	jmp    24b8 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    606f:	89 c7                	mov    %eax,%edi
    6071:	c5 f8 77             	vzeroupper
    6074:	e9 52 c4 ff ff       	jmp    24cb <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x13>
    6079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00006080 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    6080:	56                   	push   %esi
    6081:	53                   	push   %ebx
    6082:	e8 e9 06 00 00       	call   6770 <__x86.get_pc_thunk.si>
    6087:	81 c6 35 8e 00 00    	add    $0x8e35,%esi
    608d:	83 ec 04             	sub    $0x4,%esp
    6090:	e8 fb fa ff ff       	call   5b90 <_Z8draw_ulnv>
    6095:	8b 9e a8 02 00 00    	mov    0x2a8(%esi),%ebx
    609b:	8b b6 ac 02 00 00    	mov    0x2ac(%esi),%esi
    60a1:	39 de                	cmp    %ebx,%esi
    60a3:	0f 84 03 01 00 00    	je     61ac <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x12c>
    60a9:	89 f0                	mov    %esi,%eax
    60ab:	29 d8                	sub    %ebx,%eax
    60ad:	83 e8 18             	sub    $0x18,%eax
    60b0:	c1 e8 03             	shr    $0x3,%eax
    60b3:	69 d0 ab aa aa 0a    	imul   $0xaaaaaab,%eax,%edx
    60b9:	42                   	inc    %edx
    60ba:	83 e2 07             	and    $0x7,%edx
    60bd:	0f 84 80 00 00 00    	je     6143 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    60c3:	83 fa 01             	cmp    $0x1,%edx
    60c6:	74 68                	je     6130 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xb0>
    60c8:	83 fa 02             	cmp    $0x2,%edx
    60cb:	74 54                	je     6121 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa1>
    60cd:	83 fa 03             	cmp    $0x3,%edx
    60d0:	74 40                	je     6112 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x92>
    60d2:	83 fa 04             	cmp    $0x4,%edx
    60d5:	74 2c                	je     6103 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x83>
    60d7:	83 fa 05             	cmp    $0x5,%edx
    60da:	74 18                	je     60f4 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x74>
    60dc:	83 fa 06             	cmp    $0x6,%edx
    60df:	0f 85 db 00 00 00    	jne    61c0 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x140>
    60e5:	83 ec 0c             	sub    $0xc,%esp
    60e8:	53                   	push   %ebx
    60e9:	83 c3 18             	add    $0x18,%ebx
    60ec:	e8 bf fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    60f1:	83 c4 10             	add    $0x10,%esp
    60f4:	83 ec 0c             	sub    $0xc,%esp
    60f7:	53                   	push   %ebx
    60f8:	83 c3 18             	add    $0x18,%ebx
    60fb:	e8 b0 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6100:	83 c4 10             	add    $0x10,%esp
    6103:	83 ec 0c             	sub    $0xc,%esp
    6106:	53                   	push   %ebx
    6107:	83 c3 18             	add    $0x18,%ebx
    610a:	e8 a1 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    610f:	83 c4 10             	add    $0x10,%esp
    6112:	83 ec 0c             	sub    $0xc,%esp
    6115:	53                   	push   %ebx
    6116:	83 c3 18             	add    $0x18,%ebx
    6119:	e8 92 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    611e:	83 c4 10             	add    $0x10,%esp
    6121:	83 ec 0c             	sub    $0xc,%esp
    6124:	53                   	push   %ebx
    6125:	83 c3 18             	add    $0x18,%ebx
    6128:	e8 83 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    612d:	83 c4 10             	add    $0x10,%esp
    6130:	83 ec 0c             	sub    $0xc,%esp
    6133:	53                   	push   %ebx
    6134:	83 c3 18             	add    $0x18,%ebx
    6137:	e8 74 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    613c:	83 c4 10             	add    $0x10,%esp
    613f:	39 de                	cmp    %ebx,%esi
    6141:	74 69                	je     61ac <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x12c>
    6143:	83 ec 0c             	sub    $0xc,%esp
    6146:	53                   	push   %ebx
    6147:	e8 64 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    614c:	8d 4b 18             	lea    0x18(%ebx),%ecx
    614f:	89 0c 24             	mov    %ecx,(%esp)
    6152:	e8 59 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6157:	8d 43 30             	lea    0x30(%ebx),%eax
    615a:	89 04 24             	mov    %eax,(%esp)
    615d:	e8 4e fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6162:	8d 53 48             	lea    0x48(%ebx),%edx
    6165:	89 14 24             	mov    %edx,(%esp)
    6168:	e8 43 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    616d:	8d 4b 60             	lea    0x60(%ebx),%ecx
    6170:	89 0c 24             	mov    %ecx,(%esp)
    6173:	e8 38 fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6178:	8d 43 78             	lea    0x78(%ebx),%eax
    617b:	89 04 24             	mov    %eax,(%esp)
    617e:	e8 2d fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6183:	8d 93 90 00 00 00    	lea    0x90(%ebx),%edx
    6189:	89 14 24             	mov    %edx,(%esp)
    618c:	e8 1f fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6191:	8d 8b a8 00 00 00    	lea    0xa8(%ebx),%ecx
    6197:	81 c3 c0 00 00 00    	add    $0xc0,%ebx
    619d:	89 0c 24             	mov    %ecx,(%esp)
    61a0:	e8 0b fd ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    61a5:	83 c4 10             	add    $0x10,%esp
    61a8:	39 de                	cmp    %ebx,%esi
    61aa:	75 97                	jne    6143 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    61ac:	83 c4 04             	add    $0x4,%esp
    61af:	5b                   	pop    %ebx
    61b0:	5e                   	pop    %esi
    61b1:	e9 6a fb ff ff       	jmp    5d20 <_Z8draw_blnv>
    61b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    61bd:	00 
    61be:	66 90                	xchg   %ax,%ax
    61c0:	83 ec 0c             	sub    $0xc,%esp
    61c3:	53                   	push   %ebx
    61c4:	83 c3 18             	add    $0x18,%ebx
    61c7:	e8 e4 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    61cc:	83 c4 10             	add    $0x10,%esp
    61cf:	e9 11 ff ff ff       	jmp    60e5 <_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x65>
    61d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    61db:	00 
    61dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000061e0 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    61e0:	57                   	push   %edi
    61e1:	56                   	push   %esi
    61e2:	53                   	push   %ebx
    61e3:	e8 4a d8 ff ff       	call   3a32 <__x86.get_pc_thunk.di>
    61e8:	81 c7 d4 8c 00 00    	add    $0x8cd4,%edi
    61ee:	e8 9d f9 ff ff       	call   5b90 <_Z8draw_ulnv>
    61f3:	8b 9f b4 02 00 00    	mov    0x2b4(%edi),%ebx
    61f9:	8b b7 b8 02 00 00    	mov    0x2b8(%edi),%esi
    61ff:	39 de                	cmp    %ebx,%esi
    6201:	0f 84 03 01 00 00    	je     630a <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x12a>
    6207:	89 f0                	mov    %esi,%eax
    6209:	29 d8                	sub    %ebx,%eax
    620b:	83 e8 18             	sub    $0x18,%eax
    620e:	c1 e8 03             	shr    $0x3,%eax
    6211:	69 d0 ab aa aa 0a    	imul   $0xaaaaaab,%eax,%edx
    6217:	42                   	inc    %edx
    6218:	83 e2 07             	and    $0x7,%edx
    621b:	0f 84 80 00 00 00    	je     62a1 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc1>
    6221:	83 fa 01             	cmp    $0x1,%edx
    6224:	74 68                	je     628e <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xae>
    6226:	83 fa 02             	cmp    $0x2,%edx
    6229:	74 54                	je     627f <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x9f>
    622b:	83 fa 03             	cmp    $0x3,%edx
    622e:	74 40                	je     6270 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x90>
    6230:	83 fa 04             	cmp    $0x4,%edx
    6233:	74 2c                	je     6261 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x81>
    6235:	83 fa 05             	cmp    $0x5,%edx
    6238:	74 18                	je     6252 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x72>
    623a:	83 fa 06             	cmp    $0x6,%edx
    623d:	0f 85 d8 00 00 00    	jne    631b <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x13b>
    6243:	83 ec 0c             	sub    $0xc,%esp
    6246:	53                   	push   %ebx
    6247:	83 c3 18             	add    $0x18,%ebx
    624a:	e8 61 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    624f:	83 c4 10             	add    $0x10,%esp
    6252:	83 ec 0c             	sub    $0xc,%esp
    6255:	53                   	push   %ebx
    6256:	83 c3 18             	add    $0x18,%ebx
    6259:	e8 52 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    625e:	83 c4 10             	add    $0x10,%esp
    6261:	83 ec 0c             	sub    $0xc,%esp
    6264:	53                   	push   %ebx
    6265:	83 c3 18             	add    $0x18,%ebx
    6268:	e8 43 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    626d:	83 c4 10             	add    $0x10,%esp
    6270:	83 ec 0c             	sub    $0xc,%esp
    6273:	53                   	push   %ebx
    6274:	83 c3 18             	add    $0x18,%ebx
    6277:	e8 34 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    627c:	83 c4 10             	add    $0x10,%esp
    627f:	83 ec 0c             	sub    $0xc,%esp
    6282:	53                   	push   %ebx
    6283:	83 c3 18             	add    $0x18,%ebx
    6286:	e8 25 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    628b:	83 c4 10             	add    $0x10,%esp
    628e:	83 ec 0c             	sub    $0xc,%esp
    6291:	53                   	push   %ebx
    6292:	83 c3 18             	add    $0x18,%ebx
    6295:	e8 16 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    629a:	83 c4 10             	add    $0x10,%esp
    629d:	39 de                	cmp    %ebx,%esi
    629f:	74 69                	je     630a <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x12a>
    62a1:	83 ec 0c             	sub    $0xc,%esp
    62a4:	53                   	push   %ebx
    62a5:	e8 06 fc ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62aa:	8d 4b 18             	lea    0x18(%ebx),%ecx
    62ad:	89 0c 24             	mov    %ecx,(%esp)
    62b0:	e8 fb fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62b5:	8d 43 30             	lea    0x30(%ebx),%eax
    62b8:	89 04 24             	mov    %eax,(%esp)
    62bb:	e8 f0 fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62c0:	8d 53 48             	lea    0x48(%ebx),%edx
    62c3:	89 14 24             	mov    %edx,(%esp)
    62c6:	e8 e5 fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62cb:	8d 4b 60             	lea    0x60(%ebx),%ecx
    62ce:	89 0c 24             	mov    %ecx,(%esp)
    62d1:	e8 da fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62d6:	8d 43 78             	lea    0x78(%ebx),%eax
    62d9:	89 04 24             	mov    %eax,(%esp)
    62dc:	e8 cf fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62e1:	8d 93 90 00 00 00    	lea    0x90(%ebx),%edx
    62e7:	89 14 24             	mov    %edx,(%esp)
    62ea:	e8 c1 fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    62ef:	8d 8b a8 00 00 00    	lea    0xa8(%ebx),%ecx
    62f5:	81 c3 c0 00 00 00    	add    $0xc0,%ebx
    62fb:	89 0c 24             	mov    %ecx,(%esp)
    62fe:	e8 ad fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6303:	83 c4 10             	add    $0x10,%esp
    6306:	39 de                	cmp    %ebx,%esi
    6308:	75 97                	jne    62a1 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc1>
    630a:	e8 11 fa ff ff       	call   5d20 <_Z8draw_blnv>
    630f:	83 ec 0c             	sub    $0xc,%esp
    6312:	89 fb                	mov    %edi,%ebx
    6314:	6a 00                	push   $0x0
    6316:	e8 15 c0 ff ff       	call   2330 <exit@plt>
    631b:	83 ec 0c             	sub    $0xc,%esp
    631e:	53                   	push   %ebx
    631f:	83 c3 18             	add    $0x18,%ebx
    6322:	e8 89 fb ff ff       	call   5eb0 <_Z12print_centerRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    6327:	83 c4 10             	add    $0x10,%esp
    632a:	e9 14 ff ff ff       	jmp    6243 <_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x63>
    632f:	90                   	nop

00006330 <_ZNKSt5ctypeIcE8do_widenEc>:
    6330:	0f b6 44 24 08       	movzbl 0x8(%esp),%eax
    6335:	c3                   	ret
    6336:	66 90                	xchg   %ax,%ax
    6338:	66 90                	xchg   %ax,%ax
    633a:	66 90                	xchg   %ax,%ax
    633c:	66 90                	xchg   %ax,%ax
    633e:	66 90                	xchg   %ax,%ax

00006340 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev>:
    6340:	55                   	push   %ebp
    6341:	57                   	push   %edi
    6342:	56                   	push   %esi
    6343:	53                   	push   %ebx
    6344:	83 ec 0c             	sub    $0xc,%esp
    6347:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    634b:	e8 e0 d4 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    6350:	81 c3 6c 8b 00 00    	add    $0x8b6c,%ebx
    6356:	8b 7d 04             	mov    0x4(%ebp),%edi
    6359:	8b 75 00             	mov    0x0(%ebp),%esi
    635c:	39 f7                	cmp    %esi,%edi
    635e:	74 1f                	je     637f <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev+0x3f>
    6360:	8b 06                	mov    (%esi),%eax
    6362:	8d 56 08             	lea    0x8(%esi),%edx
    6365:	39 d0                	cmp    %edx,%eax
    6367:	74 37                	je     63a0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev+0x60>
    6369:	83 ec 0c             	sub    $0xc,%esp
    636c:	83 c6 18             	add    $0x18,%esi
    636f:	50                   	push   %eax
    6370:	e8 db be ff ff       	call   2250 <_ZdlPv@plt>
    6375:	83 c4 10             	add    $0x10,%esp
    6378:	39 f7                	cmp    %esi,%edi
    637a:	75 e4                	jne    6360 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev+0x20>
    637c:	8b 75 00             	mov    0x0(%ebp),%esi
    637f:	85 f6                	test   %esi,%esi
    6381:	74 0c                	je     638f <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev+0x4f>
    6383:	83 ec 0c             	sub    $0xc,%esp
    6386:	56                   	push   %esi
    6387:	e8 c4 be ff ff       	call   2250 <_ZdlPv@plt>
    638c:	83 c4 10             	add    $0x10,%esp
    638f:	83 c4 0c             	add    $0xc,%esp
    6392:	5b                   	pop    %ebx
    6393:	5e                   	pop    %esi
    6394:	5f                   	pop    %edi
    6395:	5d                   	pop    %ebp
    6396:	c3                   	ret
    6397:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    639e:	00 
    639f:	90                   	nop
    63a0:	83 c6 18             	add    $0x18,%esi
    63a3:	39 f7                	cmp    %esi,%edi
    63a5:	75 b9                	jne    6360 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev+0x20>
    63a7:	eb d3                	jmp    637c <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev+0x3c>
    63a9:	66 90                	xchg   %ax,%ax
    63ab:	66 90                	xchg   %ax,%ax
    63ad:	66 90                	xchg   %ax,%ax
    63af:	90                   	nop

000063b0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_>:
    63b0:	55                   	push   %ebp
    63b1:	89 e5                	mov    %esp,%ebp
    63b3:	57                   	push   %edi
    63b4:	56                   	push   %esi
    63b5:	53                   	push   %ebx
    63b6:	83 ec 4c             	sub    $0x4c,%esp
    63b9:	8b 7d 0c             	mov    0xc(%ebp),%edi
    63bc:	8b 75 10             	mov    0x10(%ebp),%esi
    63bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
    63c2:	e8 16 f6 ff ff       	call   59dd <__x86.get_pc_thunk.ax>
    63c7:	05 f5 8a 00 00       	add    $0x8af5,%eax
    63cc:	89 75 c4             	mov    %esi,-0x3c(%ebp)
    63cf:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
    63d2:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    63d5:	29 fe                	sub    %edi,%esi
    63d7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    63da:	89 f2                	mov    %esi,%edx
    63dc:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    63e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    63e5:	31 c0                	xor    %eax,%eax
    63e7:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    63ed:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    63f4:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    63fb:	c1 fa 02             	sar    $0x2,%edx
    63fe:	81 fe 54 55 55 15    	cmp    $0x15555554,%esi
    6404:	0f 87 b4 02 00 00    	ja     66be <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x30e>
    640a:	8d 3c 52             	lea    (%edx,%edx,2),%edi
    640d:	c1 e7 03             	shl    $0x3,%edi
    6410:	85 d2                	test   %edx,%edx
    6412:	0f 84 28 02 00 00    	je     6640 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x290>
    6418:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    641b:	83 ec 0c             	sub    $0xc,%esp
    641e:	57                   	push   %edi
    641f:	e8 2c bc ff ff       	call   2050 <_Znwj@plt>
    6424:	83 c4 10             	add    $0x10,%esp
    6427:	89 45 bc             	mov    %eax,-0x44(%ebp)
    642a:	8b 75 bc             	mov    -0x44(%ebp),%esi
    642d:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
    6430:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    6433:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    6436:	01 f7                	add    %esi,%edi
    6438:	89 31                	mov    %esi,(%ecx)
    643a:	89 79 08             	mov    %edi,0x8(%ecx)
    643d:	39 da                	cmp    %ebx,%edx
    643f:	74 7f                	je     64c0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x110>
    6441:	8d 45 e0             	lea    -0x20(%ebp),%eax
    6444:	29 d3                	sub    %edx,%ebx
    6446:	89 45 b8             	mov    %eax,-0x48(%ebp)
    6449:	f6 c3 04             	test   $0x4,%bl
    644c:	0f 84 1c 01 00 00    	je     656e <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x1be>
    6452:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    6455:	8b 02                	mov    (%edx),%eax
    6457:	8d 51 08             	lea    0x8(%ecx),%edx
    645a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    645d:	89 11                	mov    %edx,(%ecx)
    645f:	89 55 cc             	mov    %edx,-0x34(%ebp)
    6462:	85 c0                	test   %eax,%eax
    6464:	0f 84 36 02 00 00    	je     66a0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x2f0>
    646a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    646d:	83 ec 0c             	sub    $0xc,%esp
    6470:	50                   	push   %eax
    6471:	e8 da bc ff ff       	call   2150 <strlen@plt>
    6476:	83 c4 10             	add    $0x10,%esp
    6479:	8b 55 cc             	mov    -0x34(%ebp),%edx
    647c:	83 f8 0f             	cmp    $0xf,%eax
    647f:	89 c7                	mov    %eax,%edi
    6481:	89 45 e0             	mov    %eax,-0x20(%ebp)
    6484:	0f 87 d6 01 00 00    	ja     6660 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x2b0>
    648a:	83 f8 01             	cmp    $0x1,%eax
    648d:	0f 85 bd 01 00 00    	jne    6650 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x2a0>
    6493:	8b 75 c8             	mov    -0x38(%ebp),%esi
    6496:	8b 5d bc             	mov    -0x44(%ebp),%ebx
    6499:	0f b6 0e             	movzbl (%esi),%ecx
    649c:	88 4b 08             	mov    %cl,0x8(%ebx)
    649f:	8b 75 bc             	mov    -0x44(%ebp),%esi
    64a2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    64a6:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    64a9:	89 46 04             	mov    %eax,0x4(%esi)
    64ac:	83 c6 18             	add    $0x18,%esi
    64af:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
    64b3:	39 4d c4             	cmp    %ecx,-0x3c(%ebp)
    64b6:	0f 85 b2 00 00 00    	jne    656e <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x1be>
    64bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    64c0:	8b 7d b4             	mov    -0x4c(%ebp),%edi
    64c3:	89 77 04             	mov    %esi,0x4(%edi)
    64c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    64c9:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    64d0:	0f 85 29 02 00 00    	jne    66ff <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x34f>
    64d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    64d9:	5b                   	pop    %ebx
    64da:	5e                   	pop    %esi
    64db:	5f                   	pop    %edi
    64dc:	5d                   	pop    %ebp
    64dd:	c3                   	ret
    64de:	66 90                	xchg   %ax,%ax
    64e0:	83 f8 01             	cmp    $0x1,%eax
    64e3:	0f 85 07 01 00 00    	jne    65f0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x240>
    64e9:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    64ec:	0f b6 19             	movzbl (%ecx),%ebx
    64ef:	88 5e 08             	mov    %bl,0x8(%esi)
    64f2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    64f5:	89 46 04             	mov    %eax,0x4(%esi)
    64f8:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
    64fc:	8b 59 04             	mov    0x4(%ecx),%ebx
    64ff:	8d 79 04             	lea    0x4(%ecx),%edi
    6502:	89 7d cc             	mov    %edi,-0x34(%ebp)
    6505:	8d 7e 18             	lea    0x18(%esi),%edi
    6508:	8d 47 08             	lea    0x8(%edi),%eax
    650b:	89 fe                	mov    %edi,%esi
    650d:	89 07                	mov    %eax,(%edi)
    650f:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    6512:	85 db                	test   %ebx,%ebx
    6514:	0f 84 86 01 00 00    	je     66a0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x2f0>
    651a:	83 ec 0c             	sub    $0xc,%esp
    651d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    6520:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    6523:	ff 75 d4             	push   -0x2c(%ebp)
    6526:	e8 25 bc ff ff       	call   2150 <strlen@plt>
    652b:	83 c4 10             	add    $0x10,%esp
    652e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6531:	83 f8 0f             	cmp    $0xf,%eax
    6534:	89 45 c0             	mov    %eax,-0x40(%ebp)
    6537:	89 45 e0             	mov    %eax,-0x20(%ebp)
    653a:	0f 87 c0 00 00 00    	ja     6600 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x250>
    6540:	83 f8 01             	cmp    $0x1,%eax
    6543:	0f 85 97 00 00 00    	jne    65e0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x230>
    6549:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    654c:	0f b6 19             	movzbl (%ecx),%ebx
    654f:	88 5f 08             	mov    %bl,0x8(%edi)
    6552:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    6555:	89 47 04             	mov    %eax,0x4(%edi)
    6558:	8d 77 18             	lea    0x18(%edi),%esi
    655b:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
    655f:	83 c1 04             	add    $0x4,%ecx
    6562:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    6565:	39 4d c4             	cmp    %ecx,-0x3c(%ebp)
    6568:	0f 84 52 ff ff ff    	je     64c0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x110>
    656e:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    6571:	8d 56 08             	lea    0x8(%esi),%edx
    6574:	89 16                	mov    %edx,(%esi)
    6576:	8b 03                	mov    (%ebx),%eax
    6578:	89 45 cc             	mov    %eax,-0x34(%ebp)
    657b:	85 c0                	test   %eax,%eax
    657d:	0f 84 1d 01 00 00    	je     66a0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x2f0>
    6583:	83 ec 0c             	sub    $0xc,%esp
    6586:	89 55 c8             	mov    %edx,-0x38(%ebp)
    6589:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    658c:	ff 75 cc             	push   -0x34(%ebp)
    658f:	e8 bc bb ff ff       	call   2150 <strlen@plt>
    6594:	83 c4 10             	add    $0x10,%esp
    6597:	8b 55 c8             	mov    -0x38(%ebp),%edx
    659a:	83 f8 0f             	cmp    $0xf,%eax
    659d:	89 c7                	mov    %eax,%edi
    659f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    65a2:	0f 86 38 ff ff ff    	jbe    64e0 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x130>
    65a8:	83 ec 04             	sub    $0x4,%esp
    65ab:	6a 00                	push   $0x0
    65ad:	ff 75 b8             	push   -0x48(%ebp)
    65b0:	56                   	push   %esi
    65b1:	e8 fa bd ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    65b6:	83 c4 10             	add    $0x10,%esp
    65b9:	89 c2                	mov    %eax,%edx
    65bb:	89 06                	mov    %eax,(%esi)
    65bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    65c0:	89 46 08             	mov    %eax,0x8(%esi)
    65c3:	83 ec 04             	sub    $0x4,%esp
    65c6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    65c9:	57                   	push   %edi
    65ca:	ff 75 cc             	push   -0x34(%ebp)
    65cd:	52                   	push   %edx
    65ce:	e8 5d bb ff ff       	call   2130 <memcpy@plt>
    65d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    65d6:	8b 16                	mov    (%esi),%edx
    65d8:	83 c4 10             	add    $0x10,%esp
    65db:	e9 12 ff ff ff       	jmp    64f2 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x142>
    65e0:	8b 75 c0             	mov    -0x40(%ebp),%esi
    65e3:	85 f6                	test   %esi,%esi
    65e5:	0f 84 67 ff ff ff    	je     6552 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x1a2>
    65eb:	eb 2e                	jmp    661b <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x26b>
    65ed:	8d 76 00             	lea    0x0(%esi),%esi
    65f0:	85 c0                	test   %eax,%eax
    65f2:	0f 84 fa fe ff ff    	je     64f2 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x142>
    65f8:	eb c9                	jmp    65c3 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x213>
    65fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    6600:	83 ec 04             	sub    $0x4,%esp
    6603:	6a 00                	push   $0x0
    6605:	ff 75 b8             	push   -0x48(%ebp)
    6608:	57                   	push   %edi
    6609:	e8 a2 bd ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    660e:	83 c4 10             	add    $0x10,%esp
    6611:	89 c2                	mov    %eax,%edx
    6613:	89 07                	mov    %eax,(%edi)
    6615:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6618:	89 47 08             	mov    %eax,0x8(%edi)
    661b:	83 ec 04             	sub    $0x4,%esp
    661e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    6621:	ff 75 c0             	push   -0x40(%ebp)
    6624:	ff 75 d4             	push   -0x2c(%ebp)
    6627:	52                   	push   %edx
    6628:	e8 03 bb ff ff       	call   2130 <memcpy@plt>
    662d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6630:	8b 17                	mov    (%edi),%edx
    6632:	83 c4 10             	add    $0x10,%esp
    6635:	e9 18 ff ff ff       	jmp    6552 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x1a2>
    663a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    6640:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    6647:	e9 de fd ff ff       	jmp    642a <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x7a>
    664c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    6650:	85 c0                	test   %eax,%eax
    6652:	0f 84 47 fe ff ff    	je     649f <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0xef>
    6658:	eb 26                	jmp    6680 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x2d0>
    665a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    6660:	83 ec 04             	sub    $0x4,%esp
    6663:	6a 00                	push   $0x0
    6665:	ff 75 b8             	push   -0x48(%ebp)
    6668:	ff 75 bc             	push   -0x44(%ebp)
    666b:	e8 40 bd ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    6670:	8b 75 bc             	mov    -0x44(%ebp),%esi
    6673:	83 c4 10             	add    $0x10,%esp
    6676:	89 c2                	mov    %eax,%edx
    6678:	89 06                	mov    %eax,(%esi)
    667a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    667d:	89 46 08             	mov    %eax,0x8(%esi)
    6680:	83 ec 04             	sub    $0x4,%esp
    6683:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    6686:	57                   	push   %edi
    6687:	ff 75 c8             	push   -0x38(%ebp)
    668a:	52                   	push   %edx
    668b:	e8 a0 ba ff ff       	call   2130 <memcpy@plt>
    6690:	8b 7d bc             	mov    -0x44(%ebp),%edi
    6693:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6696:	83 c4 10             	add    $0x10,%esp
    6699:	8b 17                	mov    (%edi),%edx
    669b:	e9 ff fd ff ff       	jmp    649f <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0xef>
    66a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66a3:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    66aa:	75 53                	jne    66ff <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x34f>
    66ac:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    66af:	83 ec 0c             	sub    $0xc,%esp
    66b2:	8d 93 e0 c5 ff ff    	lea    -0x3a20(%ebx),%edx
    66b8:	52                   	push   %edx
    66b9:	e8 f2 ba ff ff       	call   21b0 <_ZSt19__throw_logic_errorPKc@plt>
    66be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66c1:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    66c8:	75 35                	jne    66ff <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x34f>
    66ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    66cd:	83 ec 0c             	sub    $0xc,%esp
    66d0:	8d b3 f4 c9 ff ff    	lea    -0x360c(%ebx),%esi
    66d6:	56                   	push   %esi
    66d7:	e8 64 ba ff ff       	call   2140 <_ZSt20__throw_length_errorPKc@plt>
    66dc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    66df:	c5 f8 77             	vzeroupper
    66e2:	e8 89 bc ff ff       	call   2370 <__cxa_end_catch@plt>
    66e7:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    66ea:	8b 03                	mov    (%ebx),%eax
    66ec:	85 c0                	test   %eax,%eax
    66ee:	75 45                	jne    6735 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x385>
    66f0:	c5 f8 77             	vzeroupper
    66f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66f6:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    66fd:	74 4a                	je     6749 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x399>
    66ff:	e8 9c 42 00 00       	call   a9a0 <__stack_chk_fail_local>
    6704:	89 c7                	mov    %eax,%edi
    6706:	eb df                	jmp    66e7 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x337>
    6708:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    670b:	83 ec 0c             	sub    $0xc,%esp
    670e:	50                   	push   %eax
    670f:	c5 f8 77             	vzeroupper
    6712:	e8 d9 b9 ff ff       	call   20f0 <__cxa_begin_catch@plt>
    6717:	8b 7d bc             	mov    -0x44(%ebp),%edi
    671a:	83 c4 10             	add    $0x10,%esp
    671d:	39 fe                	cmp    %edi,%esi
    671f:	74 34                	je     6755 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x3a5>
    6721:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    6724:	83 ec 0c             	sub    $0xc,%esp
    6727:	57                   	push   %edi
    6728:	83 c7 18             	add    $0x18,%edi
    672b:	e8 80 bb ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    6730:	83 c4 10             	add    $0x10,%esp
    6733:	eb e8                	jmp    671d <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x36d>
    6735:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    6738:	83 ec 0c             	sub    $0xc,%esp
    673b:	50                   	push   %eax
    673c:	c5 f8 77             	vzeroupper
    673f:	e8 0c bb ff ff       	call   2250 <_ZdlPv@plt>
    6744:	83 c4 10             	add    $0x10,%esp
    6747:	eb aa                	jmp    66f3 <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x343>
    6749:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    674c:	83 ec 0c             	sub    $0xc,%esp
    674f:	57                   	push   %edi
    6750:	e8 7b bc ff ff       	call   23d0 <_Unwind_Resume@plt>
    6755:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6758:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    675f:	75 9e                	jne    66ff <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x34f>
    6761:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    6764:	e8 e7 bb ff ff       	call   2350 <__cxa_rethrow@plt>
    6769:	89 c7                	mov    %eax,%edi
    676b:	e9 6c ff ff ff       	jmp    66dc <_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_+0x32c>

00006770 <__x86.get_pc_thunk.si>:
    6770:	8b 34 24             	mov    (%esp),%esi
    6773:	c3                   	ret
    6774:	66 90                	xchg   %ax,%ax
    6776:	66 90                	xchg   %ax,%ax
    6778:	66 90                	xchg   %ax,%ax
    677a:	66 90                	xchg   %ax,%ax
    677c:	66 90                	xchg   %ax,%ax
    677e:	66 90                	xchg   %ax,%ax

00006780 <_Z7saxpy_cPfS_fj>:
    6780:	56                   	push   %esi
    6781:	53                   	push   %ebx
    6782:	83 ec 04             	sub    $0x4,%esp
    6785:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    6789:	85 c9                	test   %ecx,%ecx
    678b:	0f 84 0f 01 00 00    	je     68a0 <_Z7saxpy_cPfS_fj+0x120>
    6791:	8b 54 24 10          	mov    0x10(%esp),%edx
    6795:	8d 34 8d fc ff ff ff 	lea    -0x4(,%ecx,4),%esi
    679c:	d9 44 24 18          	flds   0x18(%esp)
    67a0:	8b 44 24 14          	mov    0x14(%esp),%eax
    67a4:	d9 ee                	fldz
    67a6:	c1 ee 02             	shr    $0x2,%esi
    67a9:	46                   	inc    %esi
    67aa:	83 e6 03             	and    $0x3,%esi
    67ad:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
    67b0:	74 68                	je     681a <_Z7saxpy_cPfS_fj+0x9a>
    67b2:	83 fe 01             	cmp    $0x1,%esi
    67b5:	74 41                	je     67f8 <_Z7saxpy_cPfS_fj+0x78>
    67b7:	83 fe 02             	cmp    $0x2,%esi
    67ba:	74 1e                	je     67da <_Z7saxpy_cPfS_fj+0x5a>
    67bc:	d9 c1                	fld    %st(1)
    67be:	d8 0a                	fmuls  (%edx)
    67c0:	83 c0 04             	add    $0x4,%eax
    67c3:	83 c2 04             	add    $0x4,%edx
    67c6:	d8 40 fc             	fadds  -0x4(%eax)
    67c9:	d9 1c 24             	fstps  (%esp)
    67cc:	d9 04 24             	flds   (%esp)
    67cf:	d9 50 fc             	fsts   -0x4(%eax)
    67d2:	de c1                	faddp  %st,%st(1)
    67d4:	d9 1c 24             	fstps  (%esp)
    67d7:	d9 04 24             	flds   (%esp)
    67da:	d9 c1                	fld    %st(1)
    67dc:	d8 0a                	fmuls  (%edx)
    67de:	83 c0 04             	add    $0x4,%eax
    67e1:	83 c2 04             	add    $0x4,%edx
    67e4:	d8 40 fc             	fadds  -0x4(%eax)
    67e7:	d9 1c 24             	fstps  (%esp)
    67ea:	d9 04 24             	flds   (%esp)
    67ed:	d9 50 fc             	fsts   -0x4(%eax)
    67f0:	de c1                	faddp  %st,%st(1)
    67f2:	d9 1c 24             	fstps  (%esp)
    67f5:	d9 04 24             	flds   (%esp)
    67f8:	d9 c1                	fld    %st(1)
    67fa:	d8 0a                	fmuls  (%edx)
    67fc:	83 c2 04             	add    $0x4,%edx
    67ff:	83 c0 04             	add    $0x4,%eax
    6802:	d8 40 fc             	fadds  -0x4(%eax)
    6805:	d9 1c 24             	fstps  (%esp)
    6808:	d9 04 24             	flds   (%esp)
    680b:	d9 50 fc             	fsts   -0x4(%eax)
    680e:	de c1                	faddp  %st,%st(1)
    6810:	d9 1c 24             	fstps  (%esp)
    6813:	d9 04 24             	flds   (%esp)
    6816:	39 d3                	cmp    %edx,%ebx
    6818:	74 71                	je     688b <_Z7saxpy_cPfS_fj+0x10b>
    681a:	d9 c1                	fld    %st(1)
    681c:	d8 0a                	fmuls  (%edx)
    681e:	83 c2 10             	add    $0x10,%edx
    6821:	83 c0 10             	add    $0x10,%eax
    6824:	d8 40 f0             	fadds  -0x10(%eax)
    6827:	d9 1c 24             	fstps  (%esp)
    682a:	d9 04 24             	flds   (%esp)
    682d:	d9 50 f0             	fsts   -0x10(%eax)
    6830:	de c1                	faddp  %st,%st(1)
    6832:	d9 1c 24             	fstps  (%esp)
    6835:	d9 04 24             	flds   (%esp)
    6838:	d9 c1                	fld    %st(1)
    683a:	d8 4a f4             	fmuls  -0xc(%edx)
    683d:	d8 40 f4             	fadds  -0xc(%eax)
    6840:	d9 1c 24             	fstps  (%esp)
    6843:	d9 04 24             	flds   (%esp)
    6846:	d9 50 f4             	fsts   -0xc(%eax)
    6849:	de c1                	faddp  %st,%st(1)
    684b:	d9 1c 24             	fstps  (%esp)
    684e:	d9 04 24             	flds   (%esp)
    6851:	d9 c1                	fld    %st(1)
    6853:	d8 4a f8             	fmuls  -0x8(%edx)
    6856:	d8 40 f8             	fadds  -0x8(%eax)
    6859:	d9 1c 24             	fstps  (%esp)
    685c:	d9 04 24             	flds   (%esp)
    685f:	d9 50 f8             	fsts   -0x8(%eax)
    6862:	de c1                	faddp  %st,%st(1)
    6864:	d9 1c 24             	fstps  (%esp)
    6867:	d9 04 24             	flds   (%esp)
    686a:	d9 c1                	fld    %st(1)
    686c:	d8 4a fc             	fmuls  -0x4(%edx)
    686f:	d8 40 fc             	fadds  -0x4(%eax)
    6872:	d9 1c 24             	fstps  (%esp)
    6875:	d9 04 24             	flds   (%esp)
    6878:	d9 50 fc             	fsts   -0x4(%eax)
    687b:	de c1                	faddp  %st,%st(1)
    687d:	d9 1c 24             	fstps  (%esp)
    6880:	d9 04 24             	flds   (%esp)
    6883:	39 d3                	cmp    %edx,%ebx
    6885:	75 93                	jne    681a <_Z7saxpy_cPfS_fj+0x9a>
    6887:	dd d9                	fstp   %st(1)
    6889:	eb 02                	jmp    688d <_Z7saxpy_cPfS_fj+0x10d>
    688b:	dd d9                	fstp   %st(1)
    688d:	83 c4 04             	add    $0x4,%esp
    6890:	5b                   	pop    %ebx
    6891:	5e                   	pop    %esi
    6892:	c3                   	ret
    6893:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    689a:	00 
    689b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    68a0:	83 c4 04             	add    $0x4,%esp
    68a3:	d9 ee                	fldz
    68a5:	5b                   	pop    %ebx
    68a6:	5e                   	pop    %esi
    68a7:	c3                   	ret
    68a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    68af:	00 

000068b0 <_Z20saxpy_sse_intrinsicsPfS_fj>:
    68b0:	57                   	push   %edi
    68b1:	56                   	push   %esi
    68b2:	53                   	push   %ebx
    68b3:	83 ec 10             	sub    $0x10,%esp
    68b6:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    68ba:	c4 e2 79 18 54 24 28 	vbroadcastss 0x28(%esp),%xmm2
    68c1:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    68c5:	8b 44 24 24          	mov    0x24(%esp),%eax
    68c9:	89 f3                	mov    %esi,%ebx
    68cb:	83 e3 fc             	and    $0xfffffffc,%ebx
    68ce:	83 fe 03             	cmp    $0x3,%esi
    68d1:	0f 86 29 03 00 00    	jbe    6c00 <_Z20saxpy_sse_intrinsicsPfS_fj+0x350>
    68d7:	8d 7b ff             	lea    -0x1(%ebx),%edi
    68da:	ba 04 00 00 00       	mov    $0x4,%edx
    68df:	c5 f8 28 09          	vmovaps (%ecx),%xmm1
    68e3:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    68e7:	c1 ef 02             	shr    $0x2,%edi
    68ea:	c4 e2 69 a8 08       	vfmadd213ps (%eax),%xmm2,%xmm1
    68ef:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    68f3:	c5 f8 29 08          	vmovaps %xmm1,(%eax)
    68f7:	83 e7 07             	and    $0x7,%edi
    68fa:	39 da                	cmp    %ebx,%edx
    68fc:	0f 83 99 01 00 00    	jae    6a9b <_Z20saxpy_sse_intrinsicsPfS_fj+0x1eb>
    6902:	85 ff                	test   %edi,%edi
    6904:	0f 84 d1 00 00 00    	je     69db <_Z20saxpy_sse_intrinsicsPfS_fj+0x12b>
    690a:	83 ff 01             	cmp    $0x1,%edi
    690d:	0f 84 a9 00 00 00    	je     69bc <_Z20saxpy_sse_intrinsicsPfS_fj+0x10c>
    6913:	83 ff 02             	cmp    $0x2,%edi
    6916:	0f 84 89 00 00 00    	je     69a5 <_Z20saxpy_sse_intrinsicsPfS_fj+0xf5>
    691c:	83 ff 03             	cmp    $0x3,%edi
    691f:	74 6d                	je     698e <_Z20saxpy_sse_intrinsicsPfS_fj+0xde>
    6921:	83 ff 04             	cmp    $0x4,%edi
    6924:	74 51                	je     6977 <_Z20saxpy_sse_intrinsicsPfS_fj+0xc7>
    6926:	83 ff 05             	cmp    $0x5,%edi
    6929:	74 35                	je     6960 <_Z20saxpy_sse_intrinsicsPfS_fj+0xb0>
    692b:	83 ff 06             	cmp    $0x6,%edi
    692e:	74 19                	je     6949 <_Z20saxpy_sse_intrinsicsPfS_fj+0x99>
    6930:	c5 f8 28 59 10       	vmovaps 0x10(%ecx),%xmm3
    6935:	c4 e2 69 a8 58 10    	vfmadd213ps 0x10(%eax),%xmm2,%xmm3
    693b:	c5 f8 58 c3          	vaddps %xmm3,%xmm0,%xmm0
    693f:	c5 f8 29 58 10       	vmovaps %xmm3,0x10(%eax)
    6944:	ba 08 00 00 00       	mov    $0x8,%edx
    6949:	c5 f8 28 24 91       	vmovaps (%ecx,%edx,4),%xmm4
    694e:	c4 e2 69 a8 24 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm4
    6954:	c5 f8 58 c4          	vaddps %xmm4,%xmm0,%xmm0
    6958:	c5 f8 29 24 90       	vmovaps %xmm4,(%eax,%edx,4)
    695d:	83 c2 04             	add    $0x4,%edx
    6960:	c5 f8 28 2c 91       	vmovaps (%ecx,%edx,4),%xmm5
    6965:	c4 e2 69 a8 2c 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm5
    696b:	c5 f8 58 c5          	vaddps %xmm5,%xmm0,%xmm0
    696f:	c5 f8 29 2c 90       	vmovaps %xmm5,(%eax,%edx,4)
    6974:	83 c2 04             	add    $0x4,%edx
    6977:	c5 f8 28 34 91       	vmovaps (%ecx,%edx,4),%xmm6
    697c:	c4 e2 69 a8 34 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm6
    6982:	c5 f8 58 c6          	vaddps %xmm6,%xmm0,%xmm0
    6986:	c5 f8 29 34 90       	vmovaps %xmm6,(%eax,%edx,4)
    698b:	83 c2 04             	add    $0x4,%edx
    698e:	c5 f8 28 3c 91       	vmovaps (%ecx,%edx,4),%xmm7
    6993:	c4 e2 69 a8 3c 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm7
    6999:	c5 f8 58 c7          	vaddps %xmm7,%xmm0,%xmm0
    699d:	c5 f8 29 3c 90       	vmovaps %xmm7,(%eax,%edx,4)
    69a2:	83 c2 04             	add    $0x4,%edx
    69a5:	c5 f8 28 0c 91       	vmovaps (%ecx,%edx,4),%xmm1
    69aa:	c4 e2 69 a8 0c 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm1
    69b0:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    69b4:	c5 f8 29 0c 90       	vmovaps %xmm1,(%eax,%edx,4)
    69b9:	83 c2 04             	add    $0x4,%edx
    69bc:	c5 f8 28 1c 91       	vmovaps (%ecx,%edx,4),%xmm3
    69c1:	c4 e2 69 a8 1c 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm3
    69c7:	c5 f8 29 1c 90       	vmovaps %xmm3,(%eax,%edx,4)
    69cc:	83 c2 04             	add    $0x4,%edx
    69cf:	c5 f8 58 c3          	vaddps %xmm3,%xmm0,%xmm0
    69d3:	39 da                	cmp    %ebx,%edx
    69d5:	0f 83 c0 00 00 00    	jae    6a9b <_Z20saxpy_sse_intrinsicsPfS_fj+0x1eb>
    69db:	c5 f8 28 24 91       	vmovaps (%ecx,%edx,4),%xmm4
    69e0:	c4 e2 69 a8 24 90    	vfmadd213ps (%eax,%edx,4),%xmm2,%xmm4
    69e6:	c5 f8 58 ec          	vaddps %xmm4,%xmm0,%xmm5
    69ea:	c5 f8 28 74 91 10    	vmovaps 0x10(%ecx,%edx,4),%xmm6
    69f0:	c4 e2 69 a8 74 90 10 	vfmadd213ps 0x10(%eax,%edx,4),%xmm2,%xmm6
    69f7:	c5 f8 28 4c 91 20    	vmovaps 0x20(%ecx,%edx,4),%xmm1
    69fd:	c4 e2 69 a8 4c 90 20 	vfmadd213ps 0x20(%eax,%edx,4),%xmm2,%xmm1
    6a04:	c5 f8 28 44 91 30    	vmovaps 0x30(%ecx,%edx,4),%xmm0
    6a0a:	c5 f8 29 24 90       	vmovaps %xmm4,(%eax,%edx,4)
    6a0f:	c4 e2 69 a8 44 90 30 	vfmadd213ps 0x30(%eax,%edx,4),%xmm2,%xmm0
    6a16:	c5 d0 58 fe          	vaddps %xmm6,%xmm5,%xmm7
    6a1a:	c5 f8 29 74 90 10    	vmovaps %xmm6,0x10(%eax,%edx,4)
    6a20:	c5 f8 28 6c 91 40    	vmovaps 0x40(%ecx,%edx,4),%xmm5
    6a26:	c4 e2 69 a8 6c 90 40 	vfmadd213ps 0x40(%eax,%edx,4),%xmm2,%xmm5
    6a2d:	c5 f8 29 4c 90 20    	vmovaps %xmm1,0x20(%eax,%edx,4)
    6a33:	c5 f8 29 44 90 30    	vmovaps %xmm0,0x30(%eax,%edx,4)
    6a39:	c5 c0 58 d9          	vaddps %xmm1,%xmm7,%xmm3
    6a3d:	c5 f8 28 7c 91 50    	vmovaps 0x50(%ecx,%edx,4),%xmm7
    6a43:	c4 e2 69 a8 7c 90 50 	vfmadd213ps 0x50(%eax,%edx,4),%xmm2,%xmm7
    6a4a:	c5 f8 29 6c 90 40    	vmovaps %xmm5,0x40(%eax,%edx,4)
    6a50:	c5 f8 29 7c 90 50    	vmovaps %xmm7,0x50(%eax,%edx,4)
    6a56:	c5 e0 58 e0          	vaddps %xmm0,%xmm3,%xmm4
    6a5a:	c5 f8 28 5c 91 60    	vmovaps 0x60(%ecx,%edx,4),%xmm3
    6a60:	c4 e2 69 a8 5c 90 60 	vfmadd213ps 0x60(%eax,%edx,4),%xmm2,%xmm3
    6a67:	c5 f8 28 44 91 70    	vmovaps 0x70(%ecx,%edx,4),%xmm0
    6a6d:	c5 f8 29 5c 90 60    	vmovaps %xmm3,0x60(%eax,%edx,4)
    6a73:	c4 e2 69 a8 44 90 70 	vfmadd213ps 0x70(%eax,%edx,4),%xmm2,%xmm0
    6a7a:	c5 f8 29 44 90 70    	vmovaps %xmm0,0x70(%eax,%edx,4)
    6a80:	83 c2 20             	add    $0x20,%edx
    6a83:	c5 d8 58 f5          	vaddps %xmm5,%xmm4,%xmm6
    6a87:	c5 c8 58 cf          	vaddps %xmm7,%xmm6,%xmm1
    6a8b:	c5 f0 58 e3          	vaddps %xmm3,%xmm1,%xmm4
    6a8f:	c5 d8 58 c0          	vaddps %xmm0,%xmm4,%xmm0
    6a93:	39 da                	cmp    %ebx,%edx
    6a95:	0f 82 40 ff ff ff    	jb     69db <_Z20saxpy_sse_intrinsicsPfS_fj+0x12b>
    6a9b:	c5 fb 7c d0          	vhaddps %xmm0,%xmm0,%xmm2
    6a9f:	c5 eb 7c ea          	vhaddps %xmm2,%xmm2,%xmm5
    6aa3:	c5 fa 11 6c 24 0c    	vmovss %xmm5,0xc(%esp)
    6aa9:	d9 44 24 0c          	flds   0xc(%esp)
    6aad:	39 f3                	cmp    %esi,%ebx
    6aaf:	0f 83 3e 01 00 00    	jae    6bf3 <_Z20saxpy_sse_intrinsicsPfS_fj+0x343>
    6ab5:	c1 e3 02             	shl    $0x2,%ebx
    6ab8:	d9 44 24 28          	flds   0x28(%esp)
    6abc:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
    6abf:	01 d8                	add    %ebx,%eax
    6ac1:	8d 1c b1             	lea    (%ecx,%esi,4),%ebx
    6ac4:	89 da                	mov    %ebx,%edx
    6ac6:	29 fa                	sub    %edi,%edx
    6ac8:	83 ea 04             	sub    $0x4,%edx
    6acb:	c1 ea 02             	shr    $0x2,%edx
    6ace:	42                   	inc    %edx
    6acf:	83 e2 03             	and    $0x3,%edx
    6ad2:	0f 84 88 00 00 00    	je     6b60 <_Z20saxpy_sse_intrinsicsPfS_fj+0x2b0>
    6ad8:	83 fa 01             	cmp    $0x1,%edx
    6adb:	74 53                	je     6b30 <_Z20saxpy_sse_intrinsicsPfS_fj+0x280>
    6add:	83 fa 02             	cmp    $0x2,%edx
    6ae0:	74 26                	je     6b08 <_Z20saxpy_sse_intrinsicsPfS_fj+0x258>
    6ae2:	d9 c0                	fld    %st(0)
    6ae4:	d8 0f                	fmuls  (%edi)
    6ae6:	83 c0 04             	add    $0x4,%eax
    6ae9:	83 c7 04             	add    $0x4,%edi
    6aec:	d8 40 fc             	fadds  -0x4(%eax)
    6aef:	d9 5c 24 0c          	fstps  0xc(%esp)
    6af3:	d9 44 24 0c          	flds   0xc(%esp)
    6af7:	d9 50 fc             	fsts   -0x4(%eax)
    6afa:	de c2                	faddp  %st,%st(2)
    6afc:	d9 c9                	fxch   %st(1)
    6afe:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b02:	d9 44 24 0c          	flds   0xc(%esp)
    6b06:	d9 c9                	fxch   %st(1)
    6b08:	d9 c0                	fld    %st(0)
    6b0a:	d8 0f                	fmuls  (%edi)
    6b0c:	83 c0 04             	add    $0x4,%eax
    6b0f:	83 c7 04             	add    $0x4,%edi
    6b12:	d8 40 fc             	fadds  -0x4(%eax)
    6b15:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b19:	d9 44 24 0c          	flds   0xc(%esp)
    6b1d:	d9 50 fc             	fsts   -0x4(%eax)
    6b20:	de c2                	faddp  %st,%st(2)
    6b22:	d9 c9                	fxch   %st(1)
    6b24:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b28:	d9 44 24 0c          	flds   0xc(%esp)
    6b2c:	eb 04                	jmp    6b32 <_Z20saxpy_sse_intrinsicsPfS_fj+0x282>
    6b2e:	66 90                	xchg   %ax,%ax
    6b30:	d9 c9                	fxch   %st(1)
    6b32:	d9 c1                	fld    %st(1)
    6b34:	d8 0f                	fmuls  (%edi)
    6b36:	83 c7 04             	add    $0x4,%edi
    6b39:	83 c0 04             	add    $0x4,%eax
    6b3c:	d8 40 fc             	fadds  -0x4(%eax)
    6b3f:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b43:	d9 44 24 0c          	flds   0xc(%esp)
    6b47:	d9 50 fc             	fsts   -0x4(%eax)
    6b4a:	de c1                	faddp  %st,%st(1)
    6b4c:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b50:	d9 44 24 0c          	flds   0xc(%esp)
    6b54:	39 fb                	cmp    %edi,%ebx
    6b56:	0f 84 95 00 00 00    	je     6bf1 <_Z20saxpy_sse_intrinsicsPfS_fj+0x341>
    6b5c:	eb 12                	jmp    6b70 <_Z20saxpy_sse_intrinsicsPfS_fj+0x2c0>
    6b5e:	66 90                	xchg   %ax,%ax
    6b60:	d9 c9                	fxch   %st(1)
    6b62:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6b69:	00 
    6b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    6b70:	d9 c1                	fld    %st(1)
    6b72:	d8 0f                	fmuls  (%edi)
    6b74:	83 c7 10             	add    $0x10,%edi
    6b77:	83 c0 10             	add    $0x10,%eax
    6b7a:	d8 40 f0             	fadds  -0x10(%eax)
    6b7d:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b81:	d9 44 24 0c          	flds   0xc(%esp)
    6b85:	d9 50 f0             	fsts   -0x10(%eax)
    6b88:	de c1                	faddp  %st,%st(1)
    6b8a:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b8e:	d9 44 24 0c          	flds   0xc(%esp)
    6b92:	d9 c1                	fld    %st(1)
    6b94:	d8 4f f4             	fmuls  -0xc(%edi)
    6b97:	d8 40 f4             	fadds  -0xc(%eax)
    6b9a:	d9 5c 24 0c          	fstps  0xc(%esp)
    6b9e:	d9 44 24 0c          	flds   0xc(%esp)
    6ba2:	d9 50 f4             	fsts   -0xc(%eax)
    6ba5:	de c1                	faddp  %st,%st(1)
    6ba7:	d9 5c 24 0c          	fstps  0xc(%esp)
    6bab:	d9 44 24 0c          	flds   0xc(%esp)
    6baf:	d9 c1                	fld    %st(1)
    6bb1:	d8 4f f8             	fmuls  -0x8(%edi)
    6bb4:	d8 40 f8             	fadds  -0x8(%eax)
    6bb7:	d9 5c 24 0c          	fstps  0xc(%esp)
    6bbb:	d9 44 24 0c          	flds   0xc(%esp)
    6bbf:	d9 50 f8             	fsts   -0x8(%eax)
    6bc2:	de c1                	faddp  %st,%st(1)
    6bc4:	d9 5c 24 0c          	fstps  0xc(%esp)
    6bc8:	d9 44 24 0c          	flds   0xc(%esp)
    6bcc:	d9 c1                	fld    %st(1)
    6bce:	d8 4f fc             	fmuls  -0x4(%edi)
    6bd1:	d8 40 fc             	fadds  -0x4(%eax)
    6bd4:	d9 5c 24 0c          	fstps  0xc(%esp)
    6bd8:	d9 44 24 0c          	flds   0xc(%esp)
    6bdc:	d9 50 fc             	fsts   -0x4(%eax)
    6bdf:	de c1                	faddp  %st,%st(1)
    6be1:	d9 5c 24 0c          	fstps  0xc(%esp)
    6be5:	d9 44 24 0c          	flds   0xc(%esp)
    6be9:	39 fb                	cmp    %edi,%ebx
    6beb:	75 83                	jne    6b70 <_Z20saxpy_sse_intrinsicsPfS_fj+0x2c0>
    6bed:	dd d9                	fstp   %st(1)
    6bef:	eb 02                	jmp    6bf3 <_Z20saxpy_sse_intrinsicsPfS_fj+0x343>
    6bf1:	dd d9                	fstp   %st(1)
    6bf3:	83 c4 10             	add    $0x10,%esp
    6bf6:	5b                   	pop    %ebx
    6bf7:	5e                   	pop    %esi
    6bf8:	5f                   	pop    %edi
    6bf9:	c3                   	ret
    6bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    6c00:	31 db                	xor    %ebx,%ebx
    6c02:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    6c06:	e9 90 fe ff ff       	jmp    6a9b <_Z20saxpy_sse_intrinsicsPfS_fj+0x1eb>
    6c0b:	90                   	nop
    6c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00006c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>:
    6c10:	55                   	push   %ebp
    6c11:	57                   	push   %edi
    6c12:	56                   	push   %esi
    6c13:	89 c6                	mov    %eax,%esi
    6c15:	53                   	push   %ebx
    6c16:	89 d5                	mov    %edx,%ebp
    6c18:	8d 56 08             	lea    0x8(%esi),%edx
    6c1b:	83 ec 2c             	sub    $0x2c,%esp
    6c1e:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    6c24:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    6c28:	31 c0                	xor    %eax,%eax
    6c2a:	89 16                	mov    %edx,(%esi)
    6c2c:	e8 ff cb ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    6c31:	81 c3 8b 82 00 00    	add    $0x828b,%ebx
    6c37:	85 ed                	test   %ebp,%ebp
    6c39:	0f 84 9a 00 00 00    	je     6cd9 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xc9>
    6c3f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    6c43:	83 ec 0c             	sub    $0xc,%esp
    6c46:	55                   	push   %ebp
    6c47:	e8 04 b5 ff ff       	call   2150 <strlen@plt>
    6c4c:	83 c4 10             	add    $0x10,%esp
    6c4f:	8b 54 24 0c          	mov    0xc(%esp),%edx
    6c53:	83 f8 0f             	cmp    $0xf,%eax
    6c56:	89 c7                	mov    %eax,%edi
    6c58:	89 44 24 18          	mov    %eax,0x18(%esp)
    6c5c:	77 42                	ja     6ca0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x90>
    6c5e:	83 f8 01             	cmp    $0x1,%eax
    6c61:	75 2d                	jne    6c90 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x80>
    6c63:	0f b6 4d 00          	movzbl 0x0(%ebp),%ecx
    6c67:	88 4e 08             	mov    %cl,0x8(%esi)
    6c6a:	89 46 04             	mov    %eax,0x4(%esi)
    6c6d:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
    6c71:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    6c75:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    6c7c:	75 56                	jne    6cd4 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xc4>
    6c7e:	83 c4 2c             	add    $0x2c,%esp
    6c81:	5b                   	pop    %ebx
    6c82:	5e                   	pop    %esi
    6c83:	5f                   	pop    %edi
    6c84:	5d                   	pop    %ebp
    6c85:	c3                   	ret
    6c86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6c8d:	00 
    6c8e:	66 90                	xchg   %ax,%ax
    6c90:	85 c0                	test   %eax,%eax
    6c92:	74 d6                	je     6c6a <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x5a>
    6c94:	eb 28                	jmp    6cbe <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xae>
    6c96:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6c9d:	00 
    6c9e:	66 90                	xchg   %ax,%ax
    6ca0:	83 ec 04             	sub    $0x4,%esp
    6ca3:	6a 00                	push   $0x0
    6ca5:	8d 44 24 20          	lea    0x20(%esp),%eax
    6ca9:	50                   	push   %eax
    6caa:	56                   	push   %esi
    6cab:	e8 00 b7 ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    6cb0:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    6cb4:	83 c4 10             	add    $0x10,%esp
    6cb7:	89 c2                	mov    %eax,%edx
    6cb9:	89 06                	mov    %eax,(%esi)
    6cbb:	89 4e 08             	mov    %ecx,0x8(%esi)
    6cbe:	83 ec 04             	sub    $0x4,%esp
    6cc1:	57                   	push   %edi
    6cc2:	55                   	push   %ebp
    6cc3:	52                   	push   %edx
    6cc4:	e8 67 b4 ff ff       	call   2130 <memcpy@plt>
    6cc9:	8b 44 24 28          	mov    0x28(%esp),%eax
    6ccd:	8b 16                	mov    (%esi),%edx
    6ccf:	83 c4 10             	add    $0x10,%esp
    6cd2:	eb 96                	jmp    6c6a <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x5a>
    6cd4:	e8 c7 3c 00 00       	call   a9a0 <__stack_chk_fail_local>
    6cd9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    6cdd:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    6ce4:	75 ee                	jne    6cd4 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xc4>
    6ce6:	83 ec 0c             	sub    $0xc,%esp
    6ce9:	8d b3 e0 c5 ff ff    	lea    -0x3a20(%ebx),%esi
    6cef:	56                   	push   %esi
    6cf0:	e8 bb b4 ff ff       	call   21b0 <_ZSt19__throw_logic_errorPKc@plt>
    6cf5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6cfc:	00 
    6cfd:	8d 76 00             	lea    0x0(%esi),%esi

00006d00 <_Z15report_compilerv>:
    6d00:	57                   	push   %edi
    6d01:	56                   	push   %esi
    6d02:	53                   	push   %ebx
    6d03:	e8 28 cb ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    6d08:	81 c3 b4 81 00 00    	add    $0x81b4,%ebx
    6d0e:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    6d14:	83 ec 04             	sub    $0x4,%esp
    6d17:	8d 83 df c1 ff ff    	lea    -0x3e21(%ebx),%eax
    6d1d:	6a 0c                	push   $0xc
    6d1f:	50                   	push   %eax
    6d20:	56                   	push   %esi
    6d21:	e8 ba b5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6d26:	8b 16                	mov    (%esi),%edx
    6d28:	83 c4 10             	add    $0x10,%esp
    6d2b:	8b 4a f4             	mov    -0xc(%edx),%ecx
    6d2e:	8b 7c 31 7c          	mov    0x7c(%ecx,%esi,1),%edi
    6d32:	85 ff                	test   %edi,%edi
    6d34:	74 5a                	je     6d90 <_Z15report_compilerv+0x90>
    6d36:	80 7f 1c 00          	cmpb   $0x0,0x1c(%edi)
    6d3a:	74 24                	je     6d60 <_Z15report_compilerv+0x60>
    6d3c:	0f be 47 27          	movsbl 0x27(%edi),%eax
    6d40:	83 ec 08             	sub    $0x8,%esp
    6d43:	50                   	push   %eax
    6d44:	56                   	push   %esi
    6d45:	e8 f6 b2 ff ff       	call   2040 <_ZNSo3putEc@plt>
    6d4a:	89 04 24             	mov    %eax,(%esp)
    6d4d:	e8 3e b4 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    6d52:	83 c4 10             	add    $0x10,%esp
    6d55:	5b                   	pop    %ebx
    6d56:	5e                   	pop    %esi
    6d57:	5f                   	pop    %edi
    6d58:	c3                   	ret
    6d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    6d60:	83 ec 0c             	sub    $0xc,%esp
    6d63:	57                   	push   %edi
    6d64:	e8 37 b5 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    6d69:	8b 07                	mov    (%edi),%eax
    6d6b:	8d 8b 74 74 ff ff    	lea    -0x8b8c(%ebx),%ecx
    6d71:	83 c4 10             	add    $0x10,%esp
    6d74:	8b 50 18             	mov    0x18(%eax),%edx
    6d77:	b8 0a 00 00 00       	mov    $0xa,%eax
    6d7c:	39 ca                	cmp    %ecx,%edx
    6d7e:	74 c0                	je     6d40 <_Z15report_compilerv+0x40>
    6d80:	83 ec 08             	sub    $0x8,%esp
    6d83:	6a 0a                	push   $0xa
    6d85:	57                   	push   %edi
    6d86:	ff d2                	call   *%edx
    6d88:	0f be c0             	movsbl %al,%eax
    6d8b:	83 c4 10             	add    $0x10,%esp
    6d8e:	eb b0                	jmp    6d40 <_Z15report_compilerv+0x40>
    6d90:	e8 3b b5 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    6d95:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6d9c:	00 
    6d9d:	8d 76 00             	lea    0x0(%esi),%esi

00006da0 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj>:
    6da0:	55                   	push   %ebp
    6da1:	57                   	push   %edi
    6da2:	56                   	push   %esi
    6da3:	53                   	push   %ebx
    6da4:	e8 87 ca ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    6da9:	81 c3 13 81 00 00    	add    $0x8113,%ebx
    6daf:	83 ec 10             	sub    $0x10,%esp
    6db2:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    6db8:	8d 83 ec c1 ff ff    	lea    -0x3e14(%ebx),%eax
    6dbe:	8b 7c 24 24          	mov    0x24(%esp),%edi
    6dc2:	6a 07                	push   $0x7
    6dc4:	50                   	push   %eax
    6dc5:	56                   	push   %esi
    6dc6:	e8 15 b5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6dcb:	83 c4 0c             	add    $0xc,%esp
    6dce:	ff 77 04             	push   0x4(%edi)
    6dd1:	ff 37                	push   (%edi)
    6dd3:	56                   	push   %esi
    6dd4:	e8 07 b5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6dd9:	83 c4 10             	add    $0x10,%esp
    6ddc:	8b 10                	mov    (%eax),%edx
    6dde:	89 c5                	mov    %eax,%ebp
    6de0:	8b 4a f4             	mov    -0xc(%edx),%ecx
    6de3:	8b 7c 08 7c          	mov    0x7c(%eax,%ecx,1),%edi
    6de7:	85 ff                	test   %edi,%edi
    6de9:	0f 84 08 02 00 00    	je     6ff7 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x257>
    6def:	80 7f 1c 00          	cmpb   $0x0,0x1c(%edi)
    6df3:	0f 84 87 01 00 00    	je     6f80 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x1e0>
    6df9:	0f be 47 27          	movsbl 0x27(%edi),%eax
    6dfd:	83 ec 08             	sub    $0x8,%esp
    6e00:	8d bb 86 c1 ff ff    	lea    -0x3e7a(%ebx),%edi
    6e06:	50                   	push   %eax
    6e07:	55                   	push   %ebp
    6e08:	31 ed                	xor    %ebp,%ebp
    6e0a:	e8 31 b2 ff ff       	call   2040 <_ZNSo3putEc@plt>
    6e0f:	89 04 24             	mov    %eax,(%esp)
    6e12:	e8 79 b3 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    6e17:	8b 54 24 38          	mov    0x38(%esp),%edx
    6e1b:	83 c4 10             	add    $0x10,%esp
    6e1e:	85 d2                	test   %edx,%edx
    6e20:	0f 84 1d 01 00 00    	je     6f43 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x1a3>
    6e26:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    6e2a:	83 e1 03             	and    $0x3,%ecx
    6e2d:	0f 84 81 00 00 00    	je     6eb4 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x114>
    6e33:	83 f9 01             	cmp    $0x1,%ecx
    6e36:	74 4f                	je     6e87 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0xe7>
    6e38:	83 f9 02             	cmp    $0x2,%ecx
    6e3b:	74 27                	je     6e64 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0xc4>
    6e3d:	83 ec 0c             	sub    $0xc,%esp
    6e40:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    6e44:	d9 45 00             	flds   0x0(%ebp)
    6e47:	bd 01 00 00 00       	mov    $0x1,%ebp
    6e4c:	dd 1c 24             	fstpl  (%esp)
    6e4f:	56                   	push   %esi
    6e50:	e8 0b b5 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6e55:	83 c4 0c             	add    $0xc,%esp
    6e58:	6a 01                	push   $0x1
    6e5a:	57                   	push   %edi
    6e5b:	50                   	push   %eax
    6e5c:	e8 7f b4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6e61:	83 c4 10             	add    $0x10,%esp
    6e64:	83 ec 0c             	sub    $0xc,%esp
    6e67:	8b 44 24 30          	mov    0x30(%esp),%eax
    6e6b:	d9 04 a8             	flds   (%eax,%ebp,4)
    6e6e:	45                   	inc    %ebp
    6e6f:	dd 1c 24             	fstpl  (%esp)
    6e72:	56                   	push   %esi
    6e73:	e8 e8 b4 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6e78:	83 c4 0c             	add    $0xc,%esp
    6e7b:	6a 01                	push   $0x1
    6e7d:	57                   	push   %edi
    6e7e:	50                   	push   %eax
    6e7f:	e8 5c b4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6e84:	83 c4 10             	add    $0x10,%esp
    6e87:	83 ec 0c             	sub    $0xc,%esp
    6e8a:	8b 54 24 30          	mov    0x30(%esp),%edx
    6e8e:	d9 04 aa             	flds   (%edx,%ebp,4)
    6e91:	45                   	inc    %ebp
    6e92:	dd 1c 24             	fstpl  (%esp)
    6e95:	56                   	push   %esi
    6e96:	e8 c5 b4 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6e9b:	83 c4 0c             	add    $0xc,%esp
    6e9e:	6a 01                	push   $0x1
    6ea0:	57                   	push   %edi
    6ea1:	50                   	push   %eax
    6ea2:	e8 39 b4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6ea7:	83 c4 10             	add    $0x10,%esp
    6eaa:	39 6c 24 28          	cmp    %ebp,0x28(%esp)
    6eae:	0f 84 8f 00 00 00    	je     6f43 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x1a3>
    6eb4:	83 ec 0c             	sub    $0xc,%esp
    6eb7:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    6ebb:	d9 04 a9             	flds   (%ecx,%ebp,4)
    6ebe:	dd 1c 24             	fstpl  (%esp)
    6ec1:	56                   	push   %esi
    6ec2:	e8 99 b4 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6ec7:	83 c4 0c             	add    $0xc,%esp
    6eca:	6a 01                	push   $0x1
    6ecc:	57                   	push   %edi
    6ecd:	50                   	push   %eax
    6ece:	e8 0d b4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6ed3:	8b 44 24 34          	mov    0x34(%esp),%eax
    6ed7:	d9 44 a8 04          	flds   0x4(%eax,%ebp,4)
    6edb:	89 34 24             	mov    %esi,(%esp)
    6ede:	dd 5c 24 04          	fstpl  0x4(%esp)
    6ee2:	e8 79 b4 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6ee7:	83 c4 0c             	add    $0xc,%esp
    6eea:	6a 01                	push   $0x1
    6eec:	57                   	push   %edi
    6eed:	50                   	push   %eax
    6eee:	e8 ed b3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6ef3:	8b 54 24 34          	mov    0x34(%esp),%edx
    6ef7:	d9 44 aa 08          	flds   0x8(%edx,%ebp,4)
    6efb:	89 34 24             	mov    %esi,(%esp)
    6efe:	dd 5c 24 04          	fstpl  0x4(%esp)
    6f02:	e8 59 b4 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6f07:	83 c4 0c             	add    $0xc,%esp
    6f0a:	6a 01                	push   $0x1
    6f0c:	57                   	push   %edi
    6f0d:	50                   	push   %eax
    6f0e:	e8 cd b3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6f13:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    6f17:	d9 44 a9 0c          	flds   0xc(%ecx,%ebp,4)
    6f1b:	89 34 24             	mov    %esi,(%esp)
    6f1e:	83 c5 04             	add    $0x4,%ebp
    6f21:	dd 5c 24 04          	fstpl  0x4(%esp)
    6f25:	e8 36 b4 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    6f2a:	83 c4 0c             	add    $0xc,%esp
    6f2d:	6a 01                	push   $0x1
    6f2f:	57                   	push   %edi
    6f30:	50                   	push   %eax
    6f31:	e8 aa b3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    6f36:	83 c4 10             	add    $0x10,%esp
    6f39:	39 6c 24 28          	cmp    %ebp,0x28(%esp)
    6f3d:	0f 85 71 ff ff ff    	jne    6eb4 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x114>
    6f43:	8b 3e                	mov    (%esi),%edi
    6f45:	8b 6f f4             	mov    -0xc(%edi),%ebp
    6f48:	8b 7c 35 7c          	mov    0x7c(%ebp,%esi,1),%edi
    6f4c:	85 ff                	test   %edi,%edi
    6f4e:	0f 84 a3 00 00 00    	je     6ff7 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x257>
    6f54:	80 7f 1c 00          	cmpb   $0x0,0x1c(%edi)
    6f58:	74 66                	je     6fc0 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x220>
    6f5a:	0f be 6f 27          	movsbl 0x27(%edi),%ebp
    6f5e:	83 ec 08             	sub    $0x8,%esp
    6f61:	55                   	push   %ebp
    6f62:	56                   	push   %esi
    6f63:	e8 d8 b0 ff ff       	call   2040 <_ZNSo3putEc@plt>
    6f68:	89 04 24             	mov    %eax,(%esp)
    6f6b:	e8 20 b2 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    6f70:	83 c4 1c             	add    $0x1c,%esp
    6f73:	5b                   	pop    %ebx
    6f74:	5e                   	pop    %esi
    6f75:	5f                   	pop    %edi
    6f76:	5d                   	pop    %ebp
    6f77:	c3                   	ret
    6f78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6f7f:	00 
    6f80:	83 ec 0c             	sub    $0xc,%esp
    6f83:	57                   	push   %edi
    6f84:	e8 17 b3 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    6f89:	8b 07                	mov    (%edi),%eax
    6f8b:	8d 8b 74 74 ff ff    	lea    -0x8b8c(%ebx),%ecx
    6f91:	83 c4 10             	add    $0x10,%esp
    6f94:	8b 50 18             	mov    0x18(%eax),%edx
    6f97:	b8 0a 00 00 00       	mov    $0xa,%eax
    6f9c:	39 ca                	cmp    %ecx,%edx
    6f9e:	0f 84 59 fe ff ff    	je     6dfd <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x5d>
    6fa4:	83 ec 08             	sub    $0x8,%esp
    6fa7:	6a 0a                	push   $0xa
    6fa9:	57                   	push   %edi
    6faa:	ff d2                	call   *%edx
    6fac:	0f be c0             	movsbl %al,%eax
    6faf:	83 c4 10             	add    $0x10,%esp
    6fb2:	e9 46 fe ff ff       	jmp    6dfd <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x5d>
    6fb7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    6fbe:	00 
    6fbf:	90                   	nop
    6fc0:	83 ec 0c             	sub    $0xc,%esp
    6fc3:	bd 0a 00 00 00       	mov    $0xa,%ebp
    6fc8:	57                   	push   %edi
    6fc9:	e8 d2 b2 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    6fce:	8b 07                	mov    (%edi),%eax
    6fd0:	8d 8b 74 74 ff ff    	lea    -0x8b8c(%ebx),%ecx
    6fd6:	83 c4 10             	add    $0x10,%esp
    6fd9:	8b 50 18             	mov    0x18(%eax),%edx
    6fdc:	39 ca                	cmp    %ecx,%edx
    6fde:	0f 84 7a ff ff ff    	je     6f5e <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x1be>
    6fe4:	83 ec 08             	sub    $0x8,%esp
    6fe7:	6a 0a                	push   $0xa
    6fe9:	57                   	push   %edi
    6fea:	ff d2                	call   *%edx
    6fec:	0f be e8             	movsbl %al,%ebp
    6fef:	83 c4 10             	add    $0x10,%esp
    6ff2:	e9 67 ff ff ff       	jmp    6f5e <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj+0x1be>
    6ff7:	e8 d4 b2 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    6ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00007000 <_Z18allocate_resourcesv>:
    7000:	55                   	push   %ebp
    7001:	89 e5                	mov    %esp,%ebp
    7003:	57                   	push   %edi
    7004:	56                   	push   %esi
    7005:	53                   	push   %ebx
    7006:	e8 27 ca ff ff       	call   3a32 <__x86.get_pc_thunk.di>
    700b:	81 c7 b1 7e 00 00    	add    $0x7eb1,%edi
    7011:	51                   	push   %ecx
    7012:	8d 75 e0             	lea    -0x20(%ebp),%esi
    7015:	89 fb                	mov    %edi,%ebx
    7017:	83 ec 2c             	sub    $0x2c,%esp
    701a:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    7020:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    7023:	8b 87 58 01 00 00    	mov    0x158(%edi),%eax
    7029:	c1 e0 02             	shl    $0x2,%eax
    702c:	50                   	push   %eax
    702d:	6a 40                	push   $0x40
    702f:	56                   	push   %esi
    7030:	e8 bb b1 ff ff       	call   21f0 <posix_memalign@plt>
    7035:	83 c4 10             	add    $0x10,%esp
    7038:	31 c9                	xor    %ecx,%ecx
    703a:	85 c0                	test   %eax,%eax
    703c:	75 03                	jne    7041 <_Z18allocate_resourcesv+0x41>
    703e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    7041:	8b 9f 58 01 00 00    	mov    0x158(%edi),%ebx
    7047:	83 ec 04             	sub    $0x4,%esp
    704a:	89 8f 8c 03 00 00    	mov    %ecx,0x38c(%edi)
    7050:	c1 e3 02             	shl    $0x2,%ebx
    7053:	53                   	push   %ebx
    7054:	89 fb                	mov    %edi,%ebx
    7056:	6a 40                	push   $0x40
    7058:	56                   	push   %esi
    7059:	e8 92 b1 ff ff       	call   21f0 <posix_memalign@plt>
    705e:	83 c4 10             	add    $0x10,%esp
    7061:	89 c6                	mov    %eax,%esi
    7063:	31 c0                	xor    %eax,%eax
    7065:	85 f6                	test   %esi,%esi
    7067:	75 03                	jne    706c <_Z18allocate_resourcesv+0x6c>
    7069:	8b 45 e0             	mov    -0x20(%ebp),%eax
    706c:	8b b7 24 01 00 00    	mov    0x124(%edi),%esi
    7072:	83 ec 04             	sub    $0x4,%esp
    7075:	89 87 88 03 00 00    	mov    %eax,0x388(%edi)
    707b:	8d 87 f4 c1 ff ff    	lea    -0x3e0c(%edi),%eax
    7081:	8b 16                	mov    (%esi),%edx
    7083:	8b 4a f4             	mov    -0xc(%edx),%ecx
    7086:	01 f1                	add    %esi,%ecx
    7088:	8b 59 0c             	mov    0xc(%ecx),%ebx
    708b:	83 e3 b5             	and    $0xffffffb5,%ebx
    708e:	83 cb 08             	or     $0x8,%ebx
    7091:	89 59 0c             	mov    %ebx,0xc(%ecx)
    7094:	6a 02                	push   $0x2
    7096:	89 fb                	mov    %edi,%ebx
    7098:	50                   	push   %eax
    7099:	56                   	push   %esi
    709a:	e8 41 b2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    709f:	59                   	pop    %ecx
    70a0:	58                   	pop    %eax
    70a1:	ff b7 8c 03 00 00    	push   0x38c(%edi)
    70a7:	56                   	push   %esi
    70a8:	e8 53 b1 ff ff       	call   2200 <_ZNSo9_M_insertIPKvEERSoT_@plt>
    70ad:	83 c4 10             	add    $0x10,%esp
    70b0:	8b 10                	mov    (%eax),%edx
    70b2:	89 c1                	mov    %eax,%ecx
    70b4:	8b 5a f4             	mov    -0xc(%edx),%ebx
    70b7:	8b 44 18 7c          	mov    0x7c(%eax,%ebx,1),%eax
    70bb:	85 c0                	test   %eax,%eax
    70bd:	0f 84 76 05 00 00    	je     7639 <_Z18allocate_resourcesv+0x639>
    70c3:	80 78 1c 00          	cmpb   $0x0,0x1c(%eax)
    70c7:	0f 84 a3 04 00 00    	je     7570 <_Z18allocate_resourcesv+0x570>
    70cd:	0f be 50 27          	movsbl 0x27(%eax),%edx
    70d1:	83 ec 08             	sub    $0x8,%esp
    70d4:	89 fb                	mov    %edi,%ebx
    70d6:	52                   	push   %edx
    70d7:	51                   	push   %ecx
    70d8:	e8 63 af ff ff       	call   2040 <_ZNSo3putEc@plt>
    70dd:	89 04 24             	mov    %eax,(%esp)
    70e0:	e8 ab b0 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    70e5:	83 c4 0c             	add    $0xc,%esp
    70e8:	8d 87 f7 c1 ff ff    	lea    -0x3e09(%edi),%eax
    70ee:	6a 02                	push   $0x2
    70f0:	50                   	push   %eax
    70f1:	56                   	push   %esi
    70f2:	e8 e9 b1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    70f7:	58                   	pop    %eax
    70f8:	5a                   	pop    %edx
    70f9:	ff b7 88 03 00 00    	push   0x388(%edi)
    70ff:	56                   	push   %esi
    7100:	e8 fb b0 ff ff       	call   2200 <_ZNSo9_M_insertIPKvEERSoT_@plt>
    7105:	83 c4 10             	add    $0x10,%esp
    7108:	8b 18                	mov    (%eax),%ebx
    710a:	89 c1                	mov    %eax,%ecx
    710c:	8b 53 f4             	mov    -0xc(%ebx),%edx
    710f:	8b 44 10 7c          	mov    0x7c(%eax,%edx,1),%eax
    7113:	85 c0                	test   %eax,%eax
    7115:	0f 84 1e 05 00 00    	je     7639 <_Z18allocate_resourcesv+0x639>
    711b:	80 78 1c 00          	cmpb   $0x0,0x1c(%eax)
    711f:	0f 84 9b 04 00 00    	je     75c0 <_Z18allocate_resourcesv+0x5c0>
    7125:	0f be 50 27          	movsbl 0x27(%eax),%edx
    7129:	83 ec 08             	sub    $0x8,%esp
    712c:	89 fb                	mov    %edi,%ebx
    712e:	52                   	push   %edx
    712f:	51                   	push   %ecx
    7130:	e8 0b af ff ff       	call   2040 <_ZNSo3putEc@plt>
    7135:	89 04 24             	mov    %eax,(%esp)
    7138:	e8 53 b0 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    713d:	8b 06                	mov    (%esi),%eax
    713f:	8b 8f 58 01 00 00    	mov    0x158(%edi),%ecx
    7145:	83 c4 10             	add    $0x10,%esp
    7148:	03 70 f4             	add    -0xc(%eax),%esi
    714b:	8b 5e 0c             	mov    0xc(%esi),%ebx
    714e:	83 e3 b5             	and    $0xffffffb5,%ebx
    7151:	83 cb 02             	or     $0x2,%ebx
    7154:	89 5e 0c             	mov    %ebx,0xc(%esi)
    7157:	85 c9                	test   %ecx,%ecx
    7159:	0f 84 49 01 00 00    	je     72a8 <_Z18allocate_resourcesv+0x2a8>
    715f:	8b 97 88 03 00 00    	mov    0x388(%edi),%edx
    7165:	8d 41 ff             	lea    -0x1(%ecx),%eax
    7168:	8b b7 8c 03 00 00    	mov    0x38c(%edi),%esi
    716e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    7171:	83 f8 06             	cmp    $0x6,%eax
    7174:	76 0e                	jbe    7184 <_Z18allocate_resourcesv+0x184>
    7176:	8d 5e 04             	lea    0x4(%esi),%ebx
    7179:	29 da                	sub    %ebx,%edx
    717b:	83 fa 38             	cmp    $0x38,%edx
    717e:	0f 87 4c 01 00 00    	ja     72d0 <_Z18allocate_resourcesv+0x2d0>
    7184:	8d 1c 8e             	lea    (%esi,%ecx,4),%ebx
    7187:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    718a:	89 f0                	mov    %esi,%eax
    718c:	d9 87 04 cf ff ff    	flds   -0x30fc(%edi)
    7192:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    7195:	8d 1c 8d fc ff ff ff 	lea    -0x4(,%ecx,4),%ebx
    719c:	c1 eb 02             	shr    $0x2,%ebx
    719f:	43                   	inc    %ebx
    71a0:	83 e3 07             	and    $0x7,%ebx
    71a3:	0f 84 8b 00 00 00    	je     7234 <_Z18allocate_resourcesv+0x234>
    71a9:	83 fb 01             	cmp    $0x1,%ebx
    71ac:	74 72                	je     7220 <_Z18allocate_resourcesv+0x220>
    71ae:	83 fb 02             	cmp    $0x2,%ebx
    71b1:	74 5e                	je     7211 <_Z18allocate_resourcesv+0x211>
    71b3:	83 fb 03             	cmp    $0x3,%ebx
    71b6:	74 4a                	je     7202 <_Z18allocate_resourcesv+0x202>
    71b8:	83 fb 04             	cmp    $0x4,%ebx
    71bb:	74 36                	je     71f3 <_Z18allocate_resourcesv+0x1f3>
    71bd:	83 fb 05             	cmp    $0x5,%ebx
    71c0:	74 22                	je     71e4 <_Z18allocate_resourcesv+0x1e4>
    71c2:	83 fb 06             	cmp    $0x6,%ebx
    71c5:	74 0e                	je     71d5 <_Z18allocate_resourcesv+0x1d5>
    71c7:	d9 16                	fsts   (%esi)
    71c9:	8d 46 04             	lea    0x4(%esi),%eax
    71cc:	c7 02 9a 99 99 3f    	movl   $0x3f99999a,(%edx)
    71d2:	83 c2 04             	add    $0x4,%edx
    71d5:	d9 10                	fsts   (%eax)
    71d7:	83 c2 04             	add    $0x4,%edx
    71da:	83 c0 04             	add    $0x4,%eax
    71dd:	c7 42 fc 9a 99 99 3f 	movl   $0x3f99999a,-0x4(%edx)
    71e4:	d9 10                	fsts   (%eax)
    71e6:	83 c2 04             	add    $0x4,%edx
    71e9:	83 c0 04             	add    $0x4,%eax
    71ec:	c7 42 fc 9a 99 99 3f 	movl   $0x3f99999a,-0x4(%edx)
    71f3:	d9 10                	fsts   (%eax)
    71f5:	83 c2 04             	add    $0x4,%edx
    71f8:	83 c0 04             	add    $0x4,%eax
    71fb:	c7 42 fc 9a 99 99 3f 	movl   $0x3f99999a,-0x4(%edx)
    7202:	d9 10                	fsts   (%eax)
    7204:	83 c2 04             	add    $0x4,%edx
    7207:	83 c0 04             	add    $0x4,%eax
    720a:	c7 42 fc 9a 99 99 3f 	movl   $0x3f99999a,-0x4(%edx)
    7211:	d9 10                	fsts   (%eax)
    7213:	83 c2 04             	add    $0x4,%edx
    7216:	83 c0 04             	add    $0x4,%eax
    7219:	c7 42 fc 9a 99 99 3f 	movl   $0x3f99999a,-0x4(%edx)
    7220:	d9 10                	fsts   (%eax)
    7222:	83 c2 04             	add    $0x4,%edx
    7225:	c7 42 fc 9a 99 99 3f 	movl   $0x3f99999a,-0x4(%edx)
    722c:	83 c0 04             	add    $0x4,%eax
    722f:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
    7232:	74 60                	je     7294 <_Z18allocate_resourcesv+0x294>
    7234:	d9 10                	fsts   (%eax)
    7236:	d9 87 44 cf ff ff    	flds   -0x30bc(%edi)
    723c:	83 c0 20             	add    $0x20,%eax
    723f:	83 c2 20             	add    $0x20,%edx
    7242:	d9 52 e0             	fsts   -0x20(%edx)
    7245:	d9 c9                	fxch   %st(1)
    7247:	d9 50 e4             	fsts   -0x1c(%eax)
    724a:	d9 c9                	fxch   %st(1)
    724c:	d9 52 e4             	fsts   -0x1c(%edx)
    724f:	d9 c9                	fxch   %st(1)
    7251:	d9 50 e8             	fsts   -0x18(%eax)
    7254:	d9 c9                	fxch   %st(1)
    7256:	d9 52 e8             	fsts   -0x18(%edx)
    7259:	d9 c9                	fxch   %st(1)
    725b:	d9 50 ec             	fsts   -0x14(%eax)
    725e:	d9 c9                	fxch   %st(1)
    7260:	d9 52 ec             	fsts   -0x14(%edx)
    7263:	d9 c9                	fxch   %st(1)
    7265:	d9 50 f0             	fsts   -0x10(%eax)
    7268:	d9 c9                	fxch   %st(1)
    726a:	d9 52 f0             	fsts   -0x10(%edx)
    726d:	d9 c9                	fxch   %st(1)
    726f:	d9 50 f4             	fsts   -0xc(%eax)
    7272:	d9 c9                	fxch   %st(1)
    7274:	d9 52 f4             	fsts   -0xc(%edx)
    7277:	d9 c9                	fxch   %st(1)
    7279:	d9 50 f8             	fsts   -0x8(%eax)
    727c:	d9 c9                	fxch   %st(1)
    727e:	d9 52 f8             	fsts   -0x8(%edx)
    7281:	d9 c9                	fxch   %st(1)
    7283:	d9 50 fc             	fsts   -0x4(%eax)
    7286:	d9 c9                	fxch   %st(1)
    7288:	d9 5a fc             	fstps  -0x4(%edx)
    728b:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
    728e:	75 a4                	jne    7234 <_Z18allocate_resourcesv+0x234>
    7290:	df c0                	ffreep %st(0)
    7292:	eb 02                	jmp    7296 <_Z18allocate_resourcesv+0x296>
    7294:	df c0                	ffreep %st(0)
    7296:	c7 06 33 33 13 40    	movl   $0x40133333,(%esi)
    729c:	83 f9 03             	cmp    $0x3,%ecx
    729f:	76 07                	jbe    72a8 <_Z18allocate_resourcesv+0x2a8>
    72a1:	c7 46 0c cd cc ac 40 	movl   $0x40accccd,0xc(%esi)
    72a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    72ab:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    72b2:	0f 85 94 03 00 00    	jne    764c <_Z18allocate_resourcesv+0x64c>
    72b8:	8d 65 f0             	lea    -0x10(%ebp),%esp
    72bb:	59                   	pop    %ecx
    72bc:	5b                   	pop    %ebx
    72bd:	5e                   	pop    %esi
    72be:	5f                   	pop    %edi
    72bf:	5d                   	pop    %ebp
    72c0:	c3                   	ret
    72c1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    72c8:	00 
    72c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    72d0:	83 f8 0e             	cmp    $0xe,%eax
    72d3:	0f 86 56 03 00 00    	jbe    762f <_Z18allocate_resourcesv+0x62f>
    72d9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    72dc:	89 cb                	mov    %ecx,%ebx
    72de:	62 f1 7c 48 28 8f 04 	vmovaps -0x30fc(%edi),%zmm1
    72e5:	cf ff ff 
    72e8:	62 f1 7c 48 28 87 44 	vmovaps -0x30bc(%edi),%zmm0
    72ef:	cf ff ff 
    72f2:	89 75 d0             	mov    %esi,-0x30(%ebp)
    72f5:	c1 eb 04             	shr    $0x4,%ebx
    72f8:	c1 e3 06             	shl    $0x6,%ebx
    72fb:	89 d0                	mov    %edx,%eax
    72fd:	01 da                	add    %ebx,%edx
    72ff:	83 eb 40             	sub    $0x40,%ebx
    7302:	c1 eb 06             	shr    $0x6,%ebx
    7305:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7308:	43                   	inc    %ebx
    7309:	83 e3 07             	and    $0x7,%ebx
    730c:	0f 84 16 03 00 00    	je     7628 <_Z18allocate_resourcesv+0x628>
    7312:	83 fb 01             	cmp    $0x1,%ebx
    7315:	0f 84 9a 00 00 00    	je     73b5 <_Z18allocate_resourcesv+0x3b5>
    731b:	83 fb 02             	cmp    $0x2,%ebx
    731e:	74 7c                	je     739c <_Z18allocate_resourcesv+0x39c>
    7320:	83 fb 03             	cmp    $0x3,%ebx
    7323:	74 5e                	je     7383 <_Z18allocate_resourcesv+0x383>
    7325:	83 fb 04             	cmp    $0x4,%ebx
    7328:	74 40                	je     736a <_Z18allocate_resourcesv+0x36a>
    732a:	83 fb 05             	cmp    $0x5,%ebx
    732d:	74 22                	je     7351 <_Z18allocate_resourcesv+0x351>
    732f:	83 fb 06             	cmp    $0x6,%ebx
    7332:	0f 85 d3 02 00 00    	jne    760b <_Z18allocate_resourcesv+0x60b>
    7338:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    733b:	83 c0 40             	add    $0x40,%eax
    733e:	62 f1 7c 48 11 0b    	vmovups %zmm1,(%ebx)
    7344:	83 c3 40             	add    $0x40,%ebx
    7347:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    734e:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    7351:	8b 55 d0             	mov    -0x30(%ebp),%edx
    7354:	83 c0 40             	add    $0x40,%eax
    7357:	62 f1 7c 48 11 0a    	vmovups %zmm1,(%edx)
    735d:	83 c2 40             	add    $0x40,%edx
    7360:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    7367:	89 55 d0             	mov    %edx,-0x30(%ebp)
    736a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    736d:	83 c0 40             	add    $0x40,%eax
    7370:	62 f1 7c 48 11 0b    	vmovups %zmm1,(%ebx)
    7376:	83 c3 40             	add    $0x40,%ebx
    7379:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    7380:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    7383:	8b 55 d0             	mov    -0x30(%ebp),%edx
    7386:	83 c0 40             	add    $0x40,%eax
    7389:	62 f1 7c 48 11 0a    	vmovups %zmm1,(%edx)
    738f:	83 c2 40             	add    $0x40,%edx
    7392:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    7399:	89 55 d0             	mov    %edx,-0x30(%ebp)
    739c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    739f:	83 c0 40             	add    $0x40,%eax
    73a2:	62 f1 7c 48 11 0b    	vmovups %zmm1,(%ebx)
    73a8:	83 c3 40             	add    $0x40,%ebx
    73ab:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    73b2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    73b5:	8b 55 d0             	mov    -0x30(%ebp),%edx
    73b8:	83 c0 40             	add    $0x40,%eax
    73bb:	62 f1 7c 48 11 0a    	vmovups %zmm1,(%edx)
    73c1:	83 c2 40             	add    $0x40,%edx
    73c4:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    73cb:	89 55 d0             	mov    %edx,-0x30(%ebp)
    73ce:	39 45 cc             	cmp    %eax,-0x34(%ebp)
    73d1:	74 7f                	je     7452 <_Z18allocate_resourcesv+0x452>
    73d3:	62 f1 7c 48 11 0a    	vmovups %zmm1,(%edx)
    73d9:	05 00 02 00 00       	add    $0x200,%eax
    73de:	81 c2 00 02 00 00    	add    $0x200,%edx
    73e4:	62 f1 7c 48 11 40 f8 	vmovups %zmm0,-0x200(%eax)
    73eb:	62 f1 7c 48 11 4a f9 	vmovups %zmm1,-0x1c0(%edx)
    73f2:	62 f1 7c 48 11 40 f9 	vmovups %zmm0,-0x1c0(%eax)
    73f9:	62 f1 7c 48 11 4a fa 	vmovups %zmm1,-0x180(%edx)
    7400:	62 f1 7c 48 11 40 fa 	vmovups %zmm0,-0x180(%eax)
    7407:	62 f1 7c 48 11 4a fb 	vmovups %zmm1,-0x140(%edx)
    740e:	62 f1 7c 48 11 40 fb 	vmovups %zmm0,-0x140(%eax)
    7415:	62 f1 7c 48 11 4a fc 	vmovups %zmm1,-0x100(%edx)
    741c:	62 f1 7c 48 11 40 fc 	vmovups %zmm0,-0x100(%eax)
    7423:	62 f1 7c 48 11 4a fd 	vmovups %zmm1,-0xc0(%edx)
    742a:	62 f1 7c 48 11 40 fd 	vmovups %zmm0,-0xc0(%eax)
    7431:	62 f1 7c 48 11 4a fe 	vmovups %zmm1,-0x80(%edx)
    7438:	62 f1 7c 48 11 40 fe 	vmovups %zmm0,-0x80(%eax)
    743f:	62 f1 7c 48 11 4a ff 	vmovups %zmm1,-0x40(%edx)
    7446:	62 f1 7c 48 11 40 ff 	vmovups %zmm0,-0x40(%eax)
    744d:	39 45 cc             	cmp    %eax,-0x34(%ebp)
    7450:	75 81                	jne    73d3 <_Z18allocate_resourcesv+0x3d3>
    7452:	89 c8                	mov    %ecx,%eax
    7454:	83 e0 f0             	and    $0xfffffff0,%eax
    7457:	f6 c1 0f             	test   $0xf,%cl
    745a:	0f 84 00 01 00 00    	je     7560 <_Z18allocate_resourcesv+0x560>
    7460:	89 cb                	mov    %ecx,%ebx
    7462:	29 c3                	sub    %eax,%ebx
    7464:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    7467:	4b                   	dec    %ebx
    7468:	83 fb 06             	cmp    $0x6,%ebx
    746b:	76 37                	jbe    74a4 <_Z18allocate_resourcesv+0x4a4>
    746d:	c5 fc 28 97 04 cf ff 	vmovaps -0x30fc(%edi),%ymm2
    7474:	ff 
    7475:	c5 fc 28 9f 44 cf ff 	vmovaps -0x30bc(%edi),%ymm3
    747c:	ff 
    747d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7480:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
    7487:	c5 fc 11 14 1e       	vmovups %ymm2,(%esi,%ebx,1)
    748c:	c5 fc 11 1c 1a       	vmovups %ymm3,(%edx,%ebx,1)
    7491:	8b 55 d0             	mov    -0x30(%ebp),%edx
    7494:	89 d3                	mov    %edx,%ebx
    7496:	83 e3 f8             	and    $0xfffffff8,%ebx
    7499:	01 d8                	add    %ebx,%eax
    749b:	83 e2 07             	and    $0x7,%edx
    749e:	0f 84 bc 00 00 00    	je     7560 <_Z18allocate_resourcesv+0x560>
    74a4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    74ab:	d9 87 04 cf ff ff    	flds   -0x30fc(%edi)
    74b1:	8d 58 01             	lea    0x1(%eax),%ebx
    74b4:	d9 14 16             	fsts   (%esi,%edx,1)
    74b7:	d9 87 44 cf ff ff    	flds   -0x30bc(%edi)
    74bd:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    74c0:	d9 14 17             	fsts   (%edi,%edx,1)
    74c3:	39 cb                	cmp    %ecx,%ebx
    74c5:	73 6b                	jae    7532 <_Z18allocate_resourcesv+0x532>
    74c7:	d9 c9                	fxch   %st(1)
    74c9:	d9 54 16 04          	fsts   0x4(%esi,%edx,1)
    74cd:	d9 c9                	fxch   %st(1)
    74cf:	8d 58 02             	lea    0x2(%eax),%ebx
    74d2:	d9 54 17 04          	fsts   0x4(%edi,%edx,1)
    74d6:	39 cb                	cmp    %ecx,%ebx
    74d8:	73 5e                	jae    7538 <_Z18allocate_resourcesv+0x538>
    74da:	d9 c9                	fxch   %st(1)
    74dc:	d9 54 16 08          	fsts   0x8(%esi,%edx,1)
    74e0:	d9 c9                	fxch   %st(1)
    74e2:	8d 58 03             	lea    0x3(%eax),%ebx
    74e5:	d9 54 17 08          	fsts   0x8(%edi,%edx,1)
    74e9:	39 cb                	cmp    %ecx,%ebx
    74eb:	73 51                	jae    753e <_Z18allocate_resourcesv+0x53e>
    74ed:	d9 c9                	fxch   %st(1)
    74ef:	d9 54 16 0c          	fsts   0xc(%esi,%edx,1)
    74f3:	d9 c9                	fxch   %st(1)
    74f5:	8d 58 04             	lea    0x4(%eax),%ebx
    74f8:	d9 54 17 0c          	fsts   0xc(%edi,%edx,1)
    74fc:	39 cb                	cmp    %ecx,%ebx
    74fe:	73 44                	jae    7544 <_Z18allocate_resourcesv+0x544>
    7500:	d9 c9                	fxch   %st(1)
    7502:	d9 54 16 10          	fsts   0x10(%esi,%edx,1)
    7506:	d9 c9                	fxch   %st(1)
    7508:	8d 58 05             	lea    0x5(%eax),%ebx
    750b:	d9 54 17 10          	fsts   0x10(%edi,%edx,1)
    750f:	39 cb                	cmp    %ecx,%ebx
    7511:	73 37                	jae    754a <_Z18allocate_resourcesv+0x54a>
    7513:	d9 c9                	fxch   %st(1)
    7515:	d9 54 16 14          	fsts   0x14(%esi,%edx,1)
    7519:	d9 c9                	fxch   %st(1)
    751b:	83 c0 06             	add    $0x6,%eax
    751e:	d9 54 17 14          	fsts   0x14(%edi,%edx,1)
    7522:	39 c8                	cmp    %ecx,%eax
    7524:	73 2a                	jae    7550 <_Z18allocate_resourcesv+0x550>
    7526:	d9 c9                	fxch   %st(1)
    7528:	d9 5c 16 18          	fstps  0x18(%esi,%edx,1)
    752c:	d9 5c 17 18          	fstps  0x18(%edi,%edx,1)
    7530:	eb 2e                	jmp    7560 <_Z18allocate_resourcesv+0x560>
    7532:	df c0                	ffreep %st(0)
    7534:	df c0                	ffreep %st(0)
    7536:	eb 28                	jmp    7560 <_Z18allocate_resourcesv+0x560>
    7538:	df c0                	ffreep %st(0)
    753a:	df c0                	ffreep %st(0)
    753c:	eb 22                	jmp    7560 <_Z18allocate_resourcesv+0x560>
    753e:	df c0                	ffreep %st(0)
    7540:	df c0                	ffreep %st(0)
    7542:	eb 1c                	jmp    7560 <_Z18allocate_resourcesv+0x560>
    7544:	df c0                	ffreep %st(0)
    7546:	df c0                	ffreep %st(0)
    7548:	eb 16                	jmp    7560 <_Z18allocate_resourcesv+0x560>
    754a:	df c0                	ffreep %st(0)
    754c:	df c0                	ffreep %st(0)
    754e:	eb 10                	jmp    7560 <_Z18allocate_resourcesv+0x560>
    7550:	df c0                	ffreep %st(0)
    7552:	df c0                	ffreep %st(0)
    7554:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    755b:	00 
    755c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    7560:	c7 06 33 33 13 40    	movl   $0x40133333,(%esi)
    7566:	c5 f8 77             	vzeroupper
    7569:	e9 33 fd ff ff       	jmp    72a1 <_Z18allocate_resourcesv+0x2a1>
    756e:	66 90                	xchg   %ax,%ax
    7570:	83 ec 0c             	sub    $0xc,%esp
    7573:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    7576:	89 fb                	mov    %edi,%ebx
    7578:	50                   	push   %eax
    7579:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    757c:	e8 1f ad ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    7581:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7584:	83 c4 10             	add    $0x10,%esp
    7587:	ba 0a 00 00 00       	mov    $0xa,%edx
    758c:	8b 08                	mov    (%eax),%ecx
    758e:	8b 59 18             	mov    0x18(%ecx),%ebx
    7591:	8d 8f 74 74 ff ff    	lea    -0x8b8c(%edi),%ecx
    7597:	39 cb                	cmp    %ecx,%ebx
    7599:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    759c:	0f 84 2f fb ff ff    	je     70d1 <_Z18allocate_resourcesv+0xd1>
    75a2:	83 ec 08             	sub    $0x8,%esp
    75a5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    75a8:	6a 0a                	push   $0xa
    75aa:	50                   	push   %eax
    75ab:	ff d3                	call   *%ebx
    75ad:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    75b0:	0f be d0             	movsbl %al,%edx
    75b3:	83 c4 10             	add    $0x10,%esp
    75b6:	e9 16 fb ff ff       	jmp    70d1 <_Z18allocate_resourcesv+0xd1>
    75bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    75c0:	83 ec 0c             	sub    $0xc,%esp
    75c3:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    75c6:	89 fb                	mov    %edi,%ebx
    75c8:	50                   	push   %eax
    75c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    75cc:	e8 cf ac ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    75d1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    75d4:	83 c4 10             	add    $0x10,%esp
    75d7:	ba 0a 00 00 00       	mov    $0xa,%edx
    75dc:	8b 08                	mov    (%eax),%ecx
    75de:	8b 59 18             	mov    0x18(%ecx),%ebx
    75e1:	8d 8f 74 74 ff ff    	lea    -0x8b8c(%edi),%ecx
    75e7:	39 cb                	cmp    %ecx,%ebx
    75e9:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    75ec:	0f 84 37 fb ff ff    	je     7129 <_Z18allocate_resourcesv+0x129>
    75f2:	83 ec 08             	sub    $0x8,%esp
    75f5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    75f8:	6a 0a                	push   $0xa
    75fa:	50                   	push   %eax
    75fb:	ff d3                	call   *%ebx
    75fd:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    7600:	0f be d0             	movsbl %al,%edx
    7603:	83 c4 10             	add    $0x10,%esp
    7606:	e9 1e fb ff ff       	jmp    7129 <_Z18allocate_resourcesv+0x129>
    760b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    760e:	8d 56 40             	lea    0x40(%esi),%edx
    7611:	62 f1 7c 48 11 0e    	vmovups %zmm1,(%esi)
    7617:	89 55 d0             	mov    %edx,-0x30(%ebp)
    761a:	62 f1 7c 48 11 00    	vmovups %zmm0,(%eax)
    7620:	83 c0 40             	add    $0x40,%eax
    7623:	e9 10 fd ff ff       	jmp    7338 <_Z18allocate_resourcesv+0x338>
    7628:	89 f2                	mov    %esi,%edx
    762a:	e9 a4 fd ff ff       	jmp    73d3 <_Z18allocate_resourcesv+0x3d3>
    762f:	31 c0                	xor    %eax,%eax
    7631:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    7634:	e9 34 fe ff ff       	jmp    746d <_Z18allocate_resourcesv+0x46d>
    7639:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    763c:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    7643:	75 07                	jne    764c <_Z18allocate_resourcesv+0x64c>
    7645:	89 fb                	mov    %edi,%ebx
    7647:	e8 84 ac ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    764c:	e8 4f 33 00 00       	call   a9a0 <__stack_chk_fail_local>
    7651:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7658:	00 
    7659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00007660 <_Z14free_resourcesv>:
    7660:	53                   	push   %ebx
    7661:	e8 ca c1 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    7666:	81 c3 56 78 00 00    	add    $0x7856,%ebx
    766c:	83 ec 14             	sub    $0x14,%esp
    766f:	ff b3 8c 03 00 00    	push   0x38c(%ebx)
    7675:	e8 46 ac ff ff       	call   22c0 <free@plt>
    767a:	58                   	pop    %eax
    767b:	ff b3 88 03 00 00    	push   0x388(%ebx)
    7681:	e8 3a ac ff ff       	call   22c0 <free@plt>
    7686:	83 c4 18             	add    $0x18,%esp
    7689:	5b                   	pop    %ebx
    768a:	c3                   	ret
    768b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00007690 <_Z13validity_testPfS_j>:
    7690:	55                   	push   %ebp
    7691:	89 e5                	mov    %esp,%ebp
    7693:	57                   	push   %edi
    7694:	56                   	push   %esi
    7695:	53                   	push   %ebx
    7696:	e8 d5 f0 ff ff       	call   6770 <__x86.get_pc_thunk.si>
    769b:	81 c6 21 78 00 00    	add    $0x7821,%esi
    76a1:	81 ec a0 00 00 00    	sub    $0xa0,%esp
    76a7:	8b 9e 24 01 00 00    	mov    0x124(%esi),%ebx
    76ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    76b0:	8b 45 08             	mov    0x8(%ebp),%eax
    76b3:	8d 8e 7d c3 ff ff    	lea    -0x3c83(%esi),%ecx
    76b9:	89 55 80             	mov    %edx,-0x80(%ebp)
    76bc:	89 df                	mov    %ebx,%edi
    76be:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    76c4:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    76ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    76cd:	31 c0                	xor    %eax,%eax
    76cf:	6a 04                	push   $0x4
    76d1:	51                   	push   %ecx
    76d2:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
    76d5:	53                   	push   %ebx
    76d6:	89 f3                	mov    %esi,%ebx
    76d8:	e8 03 ac ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    76dd:	89 3c 24             	mov    %edi,(%esp)
    76e0:	e8 2b aa ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    76e5:	8b 45 10             	mov    0x10(%ebp),%eax
    76e8:	83 c4 0c             	add    $0xc,%esp
    76eb:	8d 55 ac             	lea    -0x54(%ebp),%edx
    76ee:	c1 e0 02             	shl    $0x2,%eax
    76f1:	50                   	push   %eax
    76f2:	6a 10                	push   $0x10
    76f4:	52                   	push   %edx
    76f5:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    76fb:	e8 f0 aa ff ff       	call   21f0 <posix_memalign@plt>
    7700:	83 c4 10             	add    $0x10,%esp
    7703:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
    770a:	00 00 00 
    770d:	85 c0                	test   %eax,%eax
    770f:	75 09                	jne    771a <_Z13validity_testPfS_j+0x8a>
    7711:	8b 4d ac             	mov    -0x54(%ebp),%ecx
    7714:	89 8d 78 ff ff ff    	mov    %ecx,-0x88(%ebp)
    771a:	83 ec 04             	sub    $0x4,%esp
    771d:	ff b5 74 ff ff ff    	push   -0x8c(%ebp)
    7723:	ff 75 80             	push   -0x80(%ebp)
    7726:	ff b5 78 ff ff ff    	push   -0x88(%ebp)
    772c:	89 f3                	mov    %esi,%ebx
    772e:	8d 7d c8             	lea    -0x38(%ebp),%edi
    7731:	e8 fa a9 ff ff       	call   2130 <memcpy@plt>
    7736:	89 3c 24             	mov    %edi,(%esp)
    7739:	89 7d 88             	mov    %edi,-0x78(%ebp)
    773c:	e8 ef c1 ff ff       	call   3930 <_ZN8CPUTimerC1Ev>
    7741:	89 3c 24             	mov    %edi,(%esp)
    7744:	e8 f7 c1 ff ff       	call   3940 <_ZN8CPUTimer5startEv>
    7749:	8b 5d 80             	mov    -0x80(%ebp),%ebx
    774c:	83 c4 10             	add    $0x10,%esp
    774f:	ff 75 10             	push   0x10(%ebp)
    7752:	68 00 00 80 3f       	push   $0x3f800000
    7757:	53                   	push   %ebx
    7758:	ff b5 6c ff ff ff    	push   -0x94(%ebp)
    775e:	ff 96 2c 02 00 00    	call   *0x22c(%esi)
    7764:	d9 9d 70 ff ff ff    	fstps  -0x90(%ebp)
    776a:	83 c4 10             	add    $0x10,%esp
    776d:	80 be 50 03 00 00 00 	cmpb   $0x0,0x350(%esi)
    7774:	74 28                	je     779e <_Z13validity_testPfS_j+0x10e>
    7776:	8d 7d b0             	lea    -0x50(%ebp),%edi
    7779:	8d 96 fa c1 ff ff    	lea    -0x3e06(%esi),%edx
    777f:	89 f8                	mov    %edi,%eax
    7781:	e8 8a f4 ff ff       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    7786:	50                   	push   %eax
    7787:	ff 75 10             	push   0x10(%ebp)
    778a:	53                   	push   %ebx
    778b:	57                   	push   %edi
    778c:	e8 0f f6 ff ff       	call   6da0 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj>
    7791:	89 f3                	mov    %esi,%ebx
    7793:	89 3c 24             	mov    %edi,(%esp)
    7796:	e8 15 ab ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    779b:	83 c4 10             	add    $0x10,%esp
    779e:	83 ec 0c             	sub    $0xc,%esp
    77a1:	ff 75 88             	push   -0x78(%ebp)
    77a4:	89 f3                	mov    %esi,%ebx
    77a6:	e8 c5 c1 ff ff       	call   3970 <_ZN8CPUTimer4stopEv>
    77ab:	5f                   	pop    %edi
    77ac:	58                   	pop    %eax
    77ad:	6a 01                	push   $0x1
    77af:	ff 75 a4             	push   -0x5c(%ebp)
    77b2:	e8 09 ac ff ff       	call   23c0 <_ZNSolsEi@plt>
    77b7:	83 c4 0c             	add    $0xc,%esp
    77ba:	89 c7                	mov    %eax,%edi
    77bc:	8d 86 86 c1 ff ff    	lea    -0x3e7a(%esi),%eax
    77c2:	6a 01                	push   $0x1
    77c4:	50                   	push   %eax
    77c5:	57                   	push   %edi
    77c6:	89 45 8c             	mov    %eax,-0x74(%ebp)
    77c9:	e8 12 ab ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    77ce:	8b 17                	mov    (%edi),%edx
    77d0:	8b 4a f4             	mov    -0xc(%edx),%ecx
    77d3:	c7 44 0f 08 19 00 00 	movl   $0x19,0x8(%edi,%ecx,1)
    77da:	00 
    77db:	58                   	pop    %eax
    77dc:	5a                   	pop    %edx
    77dd:	ff b6 30 02 00 00    	push   0x230(%esi)
    77e3:	57                   	push   %edi
    77e4:	e8 77 aa ff ff       	call   2260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    77e9:	59                   	pop    %ecx
    77ea:	5f                   	pop    %edi
    77eb:	ff 75 8c             	push   -0x74(%ebp)
    77ee:	50                   	push   %eax
    77ef:	e8 6c aa ff ff       	call   2260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    77f4:	8b 7d a4             	mov    -0x5c(%ebp),%edi
    77f7:	8b 07                	mov    (%edi),%eax
    77f9:	8b 50 f4             	mov    -0xc(%eax),%edx
    77fc:	c7 44 3a 08 14 00 00 	movl   $0x14,0x8(%edx,%edi,1)
    7803:	00 
    7804:	58                   	pop    %eax
    7805:	5a                   	pop    %edx
    7806:	57                   	push   %edi
    7807:	ff 75 88             	push   -0x78(%ebp)
    780a:	e8 91 c1 ff ff       	call   39a0 <_ZN8CPUTimer5printERSo>
    780f:	83 c4 0c             	add    $0xc,%esp
    7812:	6a 01                	push   $0x1
    7814:	ff 75 8c             	push   -0x74(%ebp)
    7817:	57                   	push   %edi
    7818:	e8 c3 aa ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    781d:	d9 85 70 ff ff ff    	flds   -0x90(%ebp)
    7823:	89 3c 24             	mov    %edi,(%esp)
    7826:	dd 95 58 ff ff ff    	fstl   -0xa8(%ebp)
    782c:	dd 5c 24 04          	fstpl  0x4(%esp)
    7830:	e8 2b ab ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    7835:	59                   	pop    %ecx
    7836:	5a                   	pop    %edx
    7837:	ff 75 8c             	push   -0x74(%ebp)
    783a:	50                   	push   %eax
    783b:	e8 20 aa ff ff       	call   2260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    7840:	89 3c 24             	mov    %edi,(%esp)
    7843:	e8 c8 a8 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    7848:	8b 96 34 02 00 00    	mov    0x234(%esi),%edx
    784e:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
    7854:	8d 0d 6c 03 00 00    	lea    0x36c,%ecx
    785a:	8d 86 70 03 00 00    	lea    0x370(%esi),%eax
    7860:	83 c4 10             	add    $0x10,%esp
    7863:	bf 02 00 00 00       	mov    $0x2,%edi
    7868:	89 5d a0             	mov    %ebx,-0x60(%ebp)
    786b:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
    786e:	89 45 9c             	mov    %eax,-0x64(%ebp)
    7871:	85 d2                	test   %edx,%edx
    7873:	0f 84 2b 02 00 00    	je     7aa4 <_Z13validity_testPfS_j+0x414>
    7879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    7880:	8b 5d 84             	mov    -0x7c(%ebp),%ebx
    7883:	8b 44 33 08          	mov    0x8(%ebx,%esi,1),%eax
    7887:	85 c0                	test   %eax,%eax
    7889:	74 47                	je     78d2 <_Z13validity_testPfS_j+0x242>
    788b:	8b 5d 9c             	mov    -0x64(%ebp),%ebx
    788e:	66 90                	xchg   %ax,%ax
    7890:	8b 50 08             	mov    0x8(%eax),%edx
    7893:	8b 48 0c             	mov    0xc(%eax),%ecx
    7896:	39 78 10             	cmp    %edi,0x10(%eax)
    7899:	72 13                	jb     78ae <_Z13validity_testPfS_j+0x21e>
    789b:	85 d2                	test   %edx,%edx
    789d:	74 23                	je     78c2 <_Z13validity_testPfS_j+0x232>
    789f:	89 c3                	mov    %eax,%ebx
    78a1:	89 d0                	mov    %edx,%eax
    78a3:	8b 50 08             	mov    0x8(%eax),%edx
    78a6:	8b 48 0c             	mov    0xc(%eax),%ecx
    78a9:	39 78 10             	cmp    %edi,0x10(%eax)
    78ac:	73 ed                	jae    789b <_Z13validity_testPfS_j+0x20b>
    78ae:	85 c9                	test   %ecx,%ecx
    78b0:	74 0e                	je     78c0 <_Z13validity_testPfS_j+0x230>
    78b2:	89 c8                	mov    %ecx,%eax
    78b4:	eb da                	jmp    7890 <_Z13validity_testPfS_j+0x200>
    78b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    78bd:	00 
    78be:	66 90                	xchg   %ax,%ax
    78c0:	89 d8                	mov    %ebx,%eax
    78c2:	8b 5d 9c             	mov    -0x64(%ebp),%ebx
    78c5:	39 d8                	cmp    %ebx,%eax
    78c7:	74 09                	je     78d2 <_Z13validity_testPfS_j+0x242>
    78c9:	3b 78 10             	cmp    0x10(%eax),%edi
    78cc:	0f 83 c0 01 00 00    	jae    7a92 <_Z13validity_testPfS_j+0x402>
    78d2:	83 ec 04             	sub    $0x4,%esp
    78d5:	ff b5 74 ff ff ff    	push   -0x8c(%ebp)
    78db:	ff b5 78 ff ff ff    	push   -0x88(%ebp)
    78e1:	ff 75 80             	push   -0x80(%ebp)
    78e4:	89 f3                	mov    %esi,%ebx
    78e6:	e8 45 a8 ff ff       	call   2130 <memcpy@plt>
    78eb:	58                   	pop    %eax
    78ec:	ff 75 88             	push   -0x78(%ebp)
    78ef:	e8 4c c0 ff ff       	call   3940 <_ZN8CPUTimer5startEv>
    78f4:	8b 55 a0             	mov    -0x60(%ebp),%edx
    78f7:	83 c4 10             	add    $0x10,%esp
    78fa:	ff 75 10             	push   0x10(%ebp)
    78fd:	68 00 00 80 3f       	push   $0x3f800000
    7902:	ff 75 80             	push   -0x80(%ebp)
    7905:	ff b5 6c ff ff ff    	push   -0x94(%ebp)
    790b:	ff 12                	call   *(%edx)
    790d:	5a                   	pop    %edx
    790e:	ff 75 88             	push   -0x78(%ebp)
    7911:	d9 9d 7c ff ff ff    	fstps  -0x84(%ebp)
    7917:	e8 54 c0 ff ff       	call   3970 <_ZN8CPUTimer4stopEv>
    791c:	59                   	pop    %ecx
    791d:	58                   	pop    %eax
    791e:	57                   	push   %edi
    791f:	ff 75 a4             	push   -0x5c(%ebp)
    7922:	e8 59 a8 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    7927:	83 c4 0c             	add    $0xc,%esp
    792a:	6a 01                	push   $0x1
    792c:	ff 75 8c             	push   -0x74(%ebp)
    792f:	89 45 90             	mov    %eax,-0x70(%ebp)
    7932:	50                   	push   %eax
    7933:	e8 a8 a9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7938:	8b 4d 90             	mov    -0x70(%ebp),%ecx
    793b:	8b 55 a0             	mov    -0x60(%ebp),%edx
    793e:	83 c4 10             	add    $0x10,%esp
    7941:	8b 01                	mov    (%ecx),%eax
    7943:	8b 58 f4             	mov    -0xc(%eax),%ebx
    7946:	c7 44 19 08 19 00 00 	movl   $0x19,0x8(%ecx,%ebx,1)
    794d:	00 
    794e:	8b 4a 04             	mov    0x4(%edx),%ecx
    7951:	85 c9                	test   %ecx,%ecx
    7953:	0f 84 56 02 00 00    	je     7baf <_Z13validity_testPfS_j+0x51f>
    7959:	83 ec 0c             	sub    $0xc,%esp
    795c:	89 f3                	mov    %esi,%ebx
    795e:	51                   	push   %ecx
    795f:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
    7965:	e8 e6 a7 ff ff       	call   2150 <strlen@plt>
    796a:	83 c4 0c             	add    $0xc,%esp
    796d:	50                   	push   %eax
    796e:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
    7974:	50                   	push   %eax
    7975:	ff 75 90             	push   -0x70(%ebp)
    7978:	e8 63 a9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    797d:	83 c4 10             	add    $0x10,%esp
    7980:	83 ec 04             	sub    $0x4,%esp
    7983:	89 f3                	mov    %esi,%ebx
    7985:	6a 01                	push   $0x1
    7987:	ff 75 8c             	push   -0x74(%ebp)
    798a:	ff 75 90             	push   -0x70(%ebp)
    798d:	e8 4e a9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7992:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    7995:	8b 01                	mov    (%ecx),%eax
    7997:	8b 58 f4             	mov    -0xc(%eax),%ebx
    799a:	c7 44 0b 08 14 00 00 	movl   $0x14,0x8(%ebx,%ecx,1)
    79a1:	00 
    79a2:	58                   	pop    %eax
    79a3:	5a                   	pop    %edx
    79a4:	51                   	push   %ecx
    79a5:	ff 75 88             	push   -0x78(%ebp)
    79a8:	89 f3                	mov    %esi,%ebx
    79aa:	e8 f1 bf ff ff       	call   39a0 <_ZN8CPUTimer5printERSo>
    79af:	83 c4 0c             	add    $0xc,%esp
    79b2:	6a 01                	push   $0x1
    79b4:	ff 75 8c             	push   -0x74(%ebp)
    79b7:	ff 75 a4             	push   -0x5c(%ebp)
    79ba:	e8 21 a9 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    79bf:	59                   	pop    %ecx
    79c0:	d9 85 7c ff ff ff    	flds   -0x84(%ebp)
    79c6:	dd 95 60 ff ff ff    	fstl   -0xa0(%ebp)
    79cc:	dd 1c 24             	fstpl  (%esp)
    79cf:	ff 75 a4             	push   -0x5c(%ebp)
    79d2:	e8 89 a9 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    79d7:	d9 85 7c ff ff ff    	flds   -0x84(%ebp)
    79dd:	d8 a5 70 ff ff ff    	fsubs  -0x90(%ebp)
    79e3:	83 c4 10             	add    $0x10,%esp
    79e6:	d9 5d 90             	fstps  -0x70(%ebp)
    79e9:	d9 45 90             	flds   -0x70(%ebp)
    79ec:	d9 e1                	fabs
    79ee:	d9 c0                	fld    %st(0)
    79f0:	db ae 84 cf ff ff    	fldt   -0x307c(%esi)
    79f6:	d9 c0                	fld    %st(0)
    79f8:	db 7d 90             	fstpt  -0x70(%ebp)
    79fb:	df f1                	fcomip %st(1),%st
    79fd:	df c0                	ffreep %st(0)
    79ff:	0f 86 cb 00 00 00    	jbe    7ad0 <_Z13validity_testPfS_j+0x440>
    7a05:	df c0                	ffreep %st(0)
    7a07:	83 ec 08             	sub    $0x8,%esp
    7a0a:	8d 8e fc c1 ff ff    	lea    -0x3e04(%esi),%ecx
    7a10:	51                   	push   %ecx
    7a11:	ff 75 a4             	push   -0x5c(%ebp)
    7a14:	e8 47 a8 ff ff       	call   2260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    7a19:	83 c4 10             	add    $0x10,%esp
    7a1c:	80 be 50 03 00 00 00 	cmpb   $0x0,0x350(%esi)
    7a23:	74 2f                	je     7a54 <_Z13validity_testPfS_j+0x3c4>
    7a25:	8d 5d b0             	lea    -0x50(%ebp),%ebx
    7a28:	8d 96 fa c1 ff ff    	lea    -0x3e06(%esi),%edx
    7a2e:	89 d8                	mov    %ebx,%eax
    7a30:	89 5d 90             	mov    %ebx,-0x70(%ebp)
    7a33:	e8 d8 f1 ff ff       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    7a38:	83 ec 04             	sub    $0x4,%esp
    7a3b:	ff 75 10             	push   0x10(%ebp)
    7a3e:	ff 75 80             	push   -0x80(%ebp)
    7a41:	53                   	push   %ebx
    7a42:	e8 59 f3 ff ff       	call   6da0 <_Z12print_vectorNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPfj>
    7a47:	89 1c 24             	mov    %ebx,(%esp)
    7a4a:	89 f3                	mov    %esi,%ebx
    7a4c:	e8 5f a8 ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    7a51:	83 c4 10             	add    $0x10,%esp
    7a54:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    7a57:	8b 02                	mov    (%edx),%eax
    7a59:	8b 48 f4             	mov    -0xc(%eax),%ecx
    7a5c:	8b 5c 11 7c          	mov    0x7c(%ecx,%edx,1),%ebx
    7a60:	89 5d 90             	mov    %ebx,-0x70(%ebp)
    7a63:	85 db                	test   %ebx,%ebx
    7a65:	0f 84 64 01 00 00    	je     7bcf <_Z13validity_testPfS_j+0x53f>
    7a6b:	80 7b 1c 00          	cmpb   $0x0,0x1c(%ebx)
    7a6f:	0f 84 fb 00 00 00    	je     7b70 <_Z13validity_testPfS_j+0x4e0>
    7a75:	0f be 53 27          	movsbl 0x27(%ebx),%edx
    7a79:	83 ec 08             	sub    $0x8,%esp
    7a7c:	89 f3                	mov    %esi,%ebx
    7a7e:	52                   	push   %edx
    7a7f:	ff 75 a4             	push   -0x5c(%ebp)
    7a82:	e8 b9 a5 ff ff       	call   2040 <_ZNSo3putEc@plt>
    7a87:	89 04 24             	mov    %eax,(%esp)
    7a8a:	e8 01 a7 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    7a8f:	83 c4 10             	add    $0x10,%esp
    7a92:	83 45 a0 08          	addl   $0x8,-0x60(%ebp)
    7a96:	8b 45 a0             	mov    -0x60(%ebp),%eax
    7a99:	47                   	inc    %edi
    7a9a:	8b 18                	mov    (%eax),%ebx
    7a9c:	85 db                	test   %ebx,%ebx
    7a9e:	0f 85 dc fd ff ff    	jne    7880 <_Z13validity_testPfS_j+0x1f0>
    7aa4:	e8 b7 fb ff ff       	call   7660 <_Z14free_resourcesv>
    7aa9:	83 ec 0c             	sub    $0xc,%esp
    7aac:	ff b5 78 ff ff ff    	push   -0x88(%ebp)
    7ab2:	89 f3                	mov    %esi,%ebx
    7ab4:	e8 07 a8 ff ff       	call   22c0 <free@plt>
    7ab9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    7ac0:	e8 6b a8 ff ff       	call   2330 <exit@plt>
    7ac5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7acc:	00 
    7acd:	8d 76 00             	lea    0x0(%esi),%esi
    7ad0:	8d 96 00 c2 ff ff    	lea    -0x3e00(%esi),%edx
    7ad6:	83 ec 08             	sub    $0x8,%esp
    7ad9:	d9 5d 90             	fstps  -0x70(%ebp)
    7adc:	52                   	push   %edx
    7add:	ff 75 a4             	push   -0x5c(%ebp)
    7ae0:	e8 7b a7 ff ff       	call   2260 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    7ae5:	8d 8e 0f c2 ff ff    	lea    -0x3df1(%esi),%ecx
    7aeb:	83 c4 0c             	add    $0xc,%esp
    7aee:	6a 0a                	push   $0xa
    7af0:	51                   	push   %ecx
    7af1:	ff 75 a4             	push   -0x5c(%ebp)
    7af4:	e8 e7 a7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7af9:	83 c4 0c             	add    $0xc,%esp
    7afc:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
    7b02:	ff b5 58 ff ff ff    	push   -0xa8(%ebp)
    7b08:	ff 75 a4             	push   -0x5c(%ebp)
    7b0b:	e8 50 a8 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    7b10:	83 c4 0c             	add    $0xc,%esp
    7b13:	8d 86 1a c2 ff ff    	lea    -0x3de6(%esi),%eax
    7b19:	6a 0a                	push   $0xa
    7b1b:	50                   	push   %eax
    7b1c:	ff 75 a4             	push   -0x5c(%ebp)
    7b1f:	e8 bc a7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7b24:	83 c4 0c             	add    $0xc,%esp
    7b27:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
    7b2d:	ff b5 60 ff ff ff    	push   -0xa0(%ebp)
    7b33:	ff 75 a4             	push   -0x5c(%ebp)
    7b36:	e8 25 a8 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    7b3b:	83 c4 0c             	add    $0xc,%esp
    7b3e:	8d 96 25 c2 ff ff    	lea    -0x3ddb(%esi),%edx
    7b44:	6a 06                	push   $0x6
    7b46:	52                   	push   %edx
    7b47:	ff 75 a4             	push   -0x5c(%ebp)
    7b4a:	e8 91 a7 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7b4f:	58                   	pop    %eax
    7b50:	d9 45 90             	flds   -0x70(%ebp)
    7b53:	dd 1c 24             	fstpl  (%esp)
    7b56:	ff 75 a4             	push   -0x5c(%ebp)
    7b59:	e8 02 a8 ff ff       	call   2360 <_ZNSo9_M_insertIdEERSoT_@plt>
    7b5e:	83 c4 10             	add    $0x10,%esp
    7b61:	e9 b6 fe ff ff       	jmp    7a1c <_Z13validity_testPfS_j+0x38c>
    7b66:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7b6d:	00 
    7b6e:	66 90                	xchg   %ax,%ax
    7b70:	83 ec 0c             	sub    $0xc,%esp
    7b73:	ff 75 90             	push   -0x70(%ebp)
    7b76:	89 f3                	mov    %esi,%ebx
    7b78:	e8 23 a7 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    7b7d:	8b 55 90             	mov    -0x70(%ebp),%edx
    7b80:	8d 8e 74 74 ff ff    	lea    -0x8b8c(%esi),%ecx
    7b86:	83 c4 10             	add    $0x10,%esp
    7b89:	8b 02                	mov    (%edx),%eax
    7b8b:	ba 0a 00 00 00       	mov    $0xa,%edx
    7b90:	8b 58 18             	mov    0x18(%eax),%ebx
    7b93:	39 cb                	cmp    %ecx,%ebx
    7b95:	0f 84 de fe ff ff    	je     7a79 <_Z13validity_testPfS_j+0x3e9>
    7b9b:	50                   	push   %eax
    7b9c:	50                   	push   %eax
    7b9d:	6a 0a                	push   $0xa
    7b9f:	ff 75 90             	push   -0x70(%ebp)
    7ba2:	ff d3                	call   *%ebx
    7ba4:	0f be d0             	movsbl %al,%edx
    7ba7:	83 c4 10             	add    $0x10,%esp
    7baa:	e9 ca fe ff ff       	jmp    7a79 <_Z13validity_testPfS_j+0x3e9>
    7baf:	8b 5d 90             	mov    -0x70(%ebp),%ebx
    7bb2:	83 ec 08             	sub    $0x8,%esp
    7bb5:	03 58 f4             	add    -0xc(%eax),%ebx
    7bb8:	8b 53 14             	mov    0x14(%ebx),%edx
    7bbb:	83 ca 01             	or     $0x1,%edx
    7bbe:	52                   	push   %edx
    7bbf:	53                   	push   %ebx
    7bc0:	89 f3                	mov    %esi,%ebx
    7bc2:	e8 c9 a7 ff ff       	call   2390 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
    7bc7:	83 c4 10             	add    $0x10,%esp
    7bca:	e9 b1 fd ff ff       	jmp    7980 <_Z13validity_testPfS_j+0x2f0>
    7bcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7bd2:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    7bd9:	75 07                	jne    7be2 <_Z13validity_testPfS_j+0x552>
    7bdb:	89 f3                	mov    %esi,%ebx
    7bdd:	e8 ee a6 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    7be2:	e8 b9 2d 00 00       	call   a9a0 <__stack_chk_fail_local>
    7be7:	89 c7                	mov    %eax,%edi
    7be9:	e9 07 a9 ff ff       	jmp    24f5 <_Z13validity_testPfS_j.cold>
    7bee:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    7bf1:	e9 27 a9 ff ff       	jmp    251d <_Z13validity_testPfS_j.cold+0x28>
    7bf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7bfd:	00 
    7bfe:	66 90                	xchg   %ax,%ax

00007c00 <_Z13methods_countv>:
    7c00:	e8 d8 dd ff ff       	call   59dd <__x86.get_pc_thunk.ax>
    7c05:	05 b7 72 00 00       	add    $0x72b7,%eax
    7c0a:	8b 90 2c 02 00 00    	mov    0x22c(%eax),%edx
    7c10:	85 d2                	test   %edx,%edx
    7c12:	0f 84 a8 00 00 00    	je     7cc0 <_Z13methods_countv+0xc0>
    7c18:	8b 88 34 02 00 00    	mov    0x234(%eax),%ecx
    7c1e:	85 c9                	test   %ecx,%ecx
    7c20:	0f 84 aa 00 00 00    	je     7cd0 <_Z13methods_countv+0xd0>
    7c26:	8b 90 3c 02 00 00    	mov    0x23c(%eax),%edx
    7c2c:	85 d2                	test   %edx,%edx
    7c2e:	0f 84 a2 00 00 00    	je     7cd6 <_Z13methods_countv+0xd6>
    7c34:	8b 88 44 02 00 00    	mov    0x244(%eax),%ecx
    7c3a:	85 c9                	test   %ecx,%ecx
    7c3c:	0f 84 9a 00 00 00    	je     7cdc <_Z13methods_countv+0xdc>
    7c42:	8b 90 4c 02 00 00    	mov    0x24c(%eax),%edx
    7c48:	85 d2                	test   %edx,%edx
    7c4a:	0f 84 92 00 00 00    	je     7ce2 <_Z13methods_countv+0xe2>
    7c50:	8b 88 54 02 00 00    	mov    0x254(%eax),%ecx
    7c56:	85 c9                	test   %ecx,%ecx
    7c58:	74 57                	je     7cb1 <_Z13methods_countv+0xb1>
    7c5a:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
    7c60:	85 d2                	test   %edx,%edx
    7c62:	0f 84 80 00 00 00    	je     7ce8 <_Z13methods_countv+0xe8>
    7c68:	8b 88 64 02 00 00    	mov    0x264(%eax),%ecx
    7c6e:	85 c9                	test   %ecx,%ecx
    7c70:	74 7c                	je     7cee <_Z13methods_countv+0xee>
    7c72:	8b 90 6c 02 00 00    	mov    0x26c(%eax),%edx
    7c78:	85 d2                	test   %edx,%edx
    7c7a:	74 78                	je     7cf4 <_Z13methods_countv+0xf4>
    7c7c:	8b 88 74 02 00 00    	mov    0x274(%eax),%ecx
    7c82:	85 c9                	test   %ecx,%ecx
    7c84:	74 74                	je     7cfa <_Z13methods_countv+0xfa>
    7c86:	8b 90 7c 02 00 00    	mov    0x27c(%eax),%edx
    7c8c:	85 d2                	test   %edx,%edx
    7c8e:	74 70                	je     7d00 <_Z13methods_countv+0x100>
    7c90:	8b 88 84 02 00 00    	mov    0x284(%eax),%ecx
    7c96:	85 c9                	test   %ecx,%ecx
    7c98:	74 6c                	je     7d06 <_Z13methods_countv+0x106>
    7c9a:	8b 90 8c 02 00 00    	mov    0x28c(%eax),%edx
    7ca0:	85 d2                	test   %edx,%edx
    7ca2:	74 68                	je     7d0c <_Z13methods_countv+0x10c>
    7ca4:	83 b8 94 02 00 00 01 	cmpl   $0x1,0x294(%eax)
    7cab:	19 c0                	sbb    %eax,%eax
    7cad:	83 c0 0e             	add    $0xe,%eax
    7cb0:	c3                   	ret
    7cb1:	b8 05 00 00 00       	mov    $0x5,%eax
    7cb6:	c3                   	ret
    7cb7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7cbe:	00 
    7cbf:	90                   	nop
    7cc0:	31 c0                	xor    %eax,%eax
    7cc2:	c3                   	ret
    7cc3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7cca:	00 
    7ccb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    7cd0:	b8 01 00 00 00       	mov    $0x1,%eax
    7cd5:	c3                   	ret
    7cd6:	b8 02 00 00 00       	mov    $0x2,%eax
    7cdb:	c3                   	ret
    7cdc:	b8 03 00 00 00       	mov    $0x3,%eax
    7ce1:	c3                   	ret
    7ce2:	b8 04 00 00 00       	mov    $0x4,%eax
    7ce7:	c3                   	ret
    7ce8:	b8 06 00 00 00       	mov    $0x6,%eax
    7ced:	c3                   	ret
    7cee:	b8 07 00 00 00       	mov    $0x7,%eax
    7cf3:	c3                   	ret
    7cf4:	b8 08 00 00 00       	mov    $0x8,%eax
    7cf9:	c3                   	ret
    7cfa:	b8 09 00 00 00       	mov    $0x9,%eax
    7cff:	c3                   	ret
    7d00:	b8 0a 00 00 00       	mov    $0xa,%eax
    7d05:	c3                   	ret
    7d06:	b8 0b 00 00 00       	mov    $0xb,%eax
    7d0b:	c3                   	ret
    7d0c:	b8 0c 00 00 00       	mov    $0xc,%eax
    7d11:	c3                   	ret
    7d12:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7d19:	00 
    7d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00007d20 <_Z12list_methodsv>:
    7d20:	55                   	push   %ebp
    7d21:	57                   	push   %edi
    7d22:	56                   	push   %esi
    7d23:	53                   	push   %ebx
    7d24:	e8 07 bb ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    7d29:	81 c3 93 71 00 00    	add    $0x7193,%ebx
    7d2f:	83 ec 1c             	sub    $0x1c,%esp
    7d32:	8b 83 2c 02 00 00    	mov    0x22c(%ebx),%eax
    7d38:	85 c0                	test   %eax,%eax
    7d3a:	0f 84 40 01 00 00    	je     7e80 <_Z12list_methodsv+0x160>
    7d40:	8d 93 2c c2 ff ff    	lea    -0x3dd4(%ebx),%edx
    7d46:	8d 8b 37 c2 ff ff    	lea    -0x3dc9(%ebx),%ecx
    7d4c:	8d ab 74 74 ff ff    	lea    -0x8b8c(%ebx),%ebp
    7d52:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    7d58:	be 01 00 00 00       	mov    $0x1,%esi
    7d5d:	89 54 24 04          	mov    %edx,0x4(%esp)
    7d61:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    7d65:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    7d69:	eb 38                	jmp    7da3 <_Z12list_methodsv+0x83>
    7d6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    7d70:	0f be 48 27          	movsbl 0x27(%eax),%ecx
    7d74:	89 0c 24             	mov    %ecx,(%esp)
    7d77:	83 ec 08             	sub    $0x8,%esp
    7d7a:	ff 74 24 08          	push   0x8(%esp)
    7d7e:	55                   	push   %ebp
    7d7f:	8d 6e 01             	lea    0x1(%esi),%ebp
    7d82:	e8 b9 a2 ff ff       	call   2040 <_ZNSo3putEc@plt>
    7d87:	89 04 24             	mov    %eax,(%esp)
    7d8a:	e8 01 a4 ff ff       	call   2190 <_ZNSo5flushEv@plt>
    7d8f:	8b 94 f3 2c 02 00 00 	mov    0x22c(%ebx,%esi,8),%edx
    7d96:	83 c4 10             	add    $0x10,%esp
    7d99:	85 d2                	test   %edx,%edx
    7d9b:	0f 84 ef 00 00 00    	je     7e90 <_Z12list_methodsv+0x170>
    7da1:	89 ee                	mov    %ebp,%esi
    7da3:	83 ec 04             	sub    $0x4,%esp
    7da6:	6a 0a                	push   $0xa
    7da8:	ff 74 24 0c          	push   0xc(%esp)
    7dac:	57                   	push   %edi
    7dad:	e8 2e a5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7db2:	5d                   	pop    %ebp
    7db3:	58                   	pop    %eax
    7db4:	56                   	push   %esi
    7db5:	57                   	push   %edi
    7db6:	e8 c5 a3 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    7dbb:	83 c4 0c             	add    $0xc,%esp
    7dbe:	6a 0d                	push   $0xd
    7dc0:	ff 74 24 10          	push   0x10(%esp)
    7dc4:	89 c5                	mov    %eax,%ebp
    7dc6:	50                   	push   %eax
    7dc7:	e8 14 a5 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7dcc:	8b 84 f3 28 02 00 00 	mov    0x228(%ebx,%esi,8),%eax
    7dd3:	83 c4 10             	add    $0x10,%esp
    7dd6:	85 c0                	test   %eax,%eax
    7dd8:	0f 84 82 00 00 00    	je     7e60 <_Z12list_methodsv+0x140>
    7dde:	83 ec 0c             	sub    $0xc,%esp
    7de1:	50                   	push   %eax
    7de2:	89 44 24 10          	mov    %eax,0x10(%esp)
    7de6:	e8 65 a3 ff ff       	call   2150 <strlen@plt>
    7deb:	83 c4 0c             	add    $0xc,%esp
    7dee:	50                   	push   %eax
    7def:	8b 54 24 08          	mov    0x8(%esp),%edx
    7df3:	52                   	push   %edx
    7df4:	55                   	push   %ebp
    7df5:	e8 e6 a4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7dfa:	83 c4 10             	add    $0x10,%esp
    7dfd:	8b 4d 00             	mov    0x0(%ebp),%ecx
    7e00:	8b 51 f4             	mov    -0xc(%ecx),%edx
    7e03:	8b 44 15 7c          	mov    0x7c(%ebp,%edx,1),%eax
    7e07:	85 c0                	test   %eax,%eax
    7e09:	0f 84 b6 00 00 00    	je     7ec5 <_Z12list_methodsv+0x1a5>
    7e0f:	80 78 1c 00          	cmpb   $0x0,0x1c(%eax)
    7e13:	0f 85 57 ff ff ff    	jne    7d70 <_Z12list_methodsv+0x50>
    7e19:	83 ec 0c             	sub    $0xc,%esp
    7e1c:	50                   	push   %eax
    7e1d:	89 44 24 10          	mov    %eax,0x10(%esp)
    7e21:	e8 7a a4 ff ff       	call   22a0 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    7e26:	8b 44 24 10          	mov    0x10(%esp),%eax
    7e2a:	83 c4 10             	add    $0x10,%esp
    7e2d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    7e31:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    7e38:	8b 08                	mov    (%eax),%ecx
    7e3a:	8b 49 18             	mov    0x18(%ecx),%ecx
    7e3d:	39 d1                	cmp    %edx,%ecx
    7e3f:	0f 84 32 ff ff ff    	je     7d77 <_Z12list_methodsv+0x57>
    7e45:	83 ec 08             	sub    $0x8,%esp
    7e48:	6a 0a                	push   $0xa
    7e4a:	50                   	push   %eax
    7e4b:	ff d1                	call   *%ecx
    7e4d:	0f be c0             	movsbl %al,%eax
    7e50:	89 44 24 10          	mov    %eax,0x10(%esp)
    7e54:	83 c4 10             	add    $0x10,%esp
    7e57:	e9 1b ff ff ff       	jmp    7d77 <_Z12list_methodsv+0x57>
    7e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    7e60:	8b 4d 00             	mov    0x0(%ebp),%ecx
    7e63:	83 ec 08             	sub    $0x8,%esp
    7e66:	8b 51 f4             	mov    -0xc(%ecx),%edx
    7e69:	01 ea                	add    %ebp,%edx
    7e6b:	8b 42 14             	mov    0x14(%edx),%eax
    7e6e:	83 c8 01             	or     $0x1,%eax
    7e71:	50                   	push   %eax
    7e72:	52                   	push   %edx
    7e73:	e8 18 a5 ff ff       	call   2390 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
    7e78:	83 c4 10             	add    $0x10,%esp
    7e7b:	e9 7d ff ff ff       	jmp    7dfd <_Z12list_methodsv+0xdd>
    7e80:	8b bb 24 01 00 00    	mov    0x124(%ebx),%edi
    7e86:	31 f6                	xor    %esi,%esi
    7e88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    7e8f:	00 
    7e90:	83 ec 04             	sub    $0x4,%esp
    7e93:	8d 83 45 c2 ff ff    	lea    -0x3dbb(%ebx),%eax
    7e99:	6a 0e                	push   $0xe
    7e9b:	50                   	push   %eax
    7e9c:	57                   	push   %edi
    7e9d:	e8 3e a4 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7ea2:	58                   	pop    %eax
    7ea3:	5a                   	pop    %edx
    7ea4:	56                   	push   %esi
    7ea5:	57                   	push   %edi
    7ea6:	e8 d5 a2 ff ff       	call   2180 <_ZNSo9_M_insertImEERSoT_@plt>
    7eab:	89 04 24             	mov    %eax,(%esp)
    7eae:	e8 5d a2 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    7eb3:	83 c4 10             	add    $0x10,%esp
    7eb6:	e8 45 ee ff ff       	call   6d00 <_Z15report_compilerv>
    7ebb:	83 ec 0c             	sub    $0xc,%esp
    7ebe:	6a 00                	push   $0x0
    7ec0:	e8 6b a4 ff ff       	call   2330 <exit@plt>
    7ec5:	e8 06 a4 ff ff       	call   22d0 <_ZSt16__throw_bad_castv@plt>
    7eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00007ed0 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    7ed0:	55                   	push   %ebp
    7ed1:	89 e5                	mov    %esp,%ebp
    7ed3:	57                   	push   %edi
    7ed4:	56                   	push   %esi
    7ed5:	53                   	push   %ebx
    7ed6:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
    7edc:	8b 7d 08             	mov    0x8(%ebp),%edi
    7edf:	e8 4c b9 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    7ee4:	81 c3 d8 6f 00 00    	add    $0x6fd8,%ebx
    7eea:	89 bd 74 ff ff ff    	mov    %edi,-0x8c(%ebp)
    7ef0:	89 9d 6c ff ff ff    	mov    %ebx,-0x94(%ebp)
    7ef6:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    7efc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    7eff:	31 c0                	xor    %eax,%eax
    7f01:	8d 83 54 c2 ff ff    	lea    -0x3dac(%ebx),%eax
    7f07:	6a 01                	push   $0x1
    7f09:	6a ff                	push   $0xffffffff
    7f0b:	50                   	push   %eax
    7f0c:	57                   	push   %edi
    7f0d:	e8 be a2 ff ff       	call   21d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofEPKcjj@plt>
    7f12:	83 c4 10             	add    $0x10,%esp
    7f15:	83 f8 ff             	cmp    $0xffffffff,%eax
    7f18:	0f 85 03 05 00 00    	jne    8421 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x551>
    7f1e:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    7f24:	8d 45 80             	lea    -0x80(%ebp),%eax
    7f27:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
    7f2d:	8d 93 5c c2 ff ff    	lea    -0x3da4(%ebx),%edx
    7f33:	e8 d8 ec ff ff       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    7f38:	8d 45 98             	lea    -0x68(%ebp),%eax
    7f3b:	8d 93 56 c2 ff ff    	lea    -0x3daa(%ebx),%edx
    7f41:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
    7f47:	e8 c4 ec ff ff       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    7f4c:	8d 45 b0             	lea    -0x50(%ebp),%eax
    7f4f:	8d 93 5b c2 ff ff    	lea    -0x3da5(%ebx),%edx
    7f55:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
    7f5b:	e8 b0 ec ff ff       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    7f60:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7f63:	8d 93 61 c2 ff ff    	lea    -0x3d9f(%ebx),%edx
    7f69:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
    7f6f:	e8 9c ec ff ff       	call   6c10 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
    7f74:	8b b3 24 01 00 00    	mov    0x124(%ebx),%esi
    7f7a:	83 ec 04             	sub    $0x4,%esp
    7f7d:	ff 75 84             	push   -0x7c(%ebp)
    7f80:	ff 75 80             	push   -0x80(%ebp)
    7f83:	56                   	push   %esi
    7f84:	e8 57 a3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7f89:	83 c4 0c             	add    $0xc,%esp
    7f8c:	8d 93 69 c2 ff ff    	lea    -0x3d97(%ebx),%edx
    7f92:	89 c7                	mov    %eax,%edi
    7f94:	6a 04                	push   $0x4
    7f96:	52                   	push   %edx
    7f97:	50                   	push   %eax
    7f98:	e8 43 a3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7f9d:	83 c4 0c             	add    $0xc,%esp
    7fa0:	ff 75 9c             	push   -0x64(%ebp)
    7fa3:	ff 75 98             	push   -0x68(%ebp)
    7fa6:	57                   	push   %edi
    7fa7:	e8 34 a3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7fac:	89 04 24             	mov    %eax,(%esp)
    7faf:	e8 5c a1 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    7fb4:	83 c4 0c             	add    $0xc,%esp
    7fb7:	8d bb 67 c2 ff ff    	lea    -0x3d99(%ebx),%edi
    7fbd:	6a 01                	push   $0x1
    7fbf:	57                   	push   %edi
    7fc0:	56                   	push   %esi
    7fc1:	e8 1a a3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7fc6:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    7fcc:	83 c4 0c             	add    $0xc,%esp
    7fcf:	ff 70 04             	push   0x4(%eax)
    7fd2:	ff 30                	push   (%eax)
    7fd4:	56                   	push   %esi
    7fd5:	e8 06 a3 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7fda:	89 04 24             	mov    %eax,(%esp)
    7fdd:	e8 2e a1 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    7fe2:	89 04 24             	mov    %eax,(%esp)
    7fe5:	e8 26 a1 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    7fea:	83 c4 0c             	add    $0xc,%esp
    7fed:	ff 75 84             	push   -0x7c(%ebp)
    7ff0:	ff 75 80             	push   -0x80(%ebp)
    7ff3:	56                   	push   %esi
    7ff4:	e8 e7 a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    7ff9:	83 c4 0c             	add    $0xc,%esp
    7ffc:	8d 93 6e c2 ff ff    	lea    -0x3d92(%ebx),%edx
    8002:	6a 08                	push   $0x8
    8004:	52                   	push   %edx
    8005:	50                   	push   %eax
    8006:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
    800c:	e8 cf a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8011:	83 c4 0c             	add    $0xc,%esp
    8014:	ff 75 9c             	push   -0x64(%ebp)
    8017:	ff 75 98             	push   -0x68(%ebp)
    801a:	ff b5 70 ff ff ff    	push   -0x90(%ebp)
    8020:	e8 bb a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8025:	89 04 24             	mov    %eax,(%esp)
    8028:	e8 e3 a0 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    802d:	83 c4 0c             	add    $0xc,%esp
    8030:	6a 01                	push   $0x1
    8032:	57                   	push   %edi
    8033:	56                   	push   %esi
    8034:	e8 a7 a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8039:	8b bd 74 ff ff ff    	mov    -0x8c(%ebp),%edi
    803f:	83 c4 0c             	add    $0xc,%esp
    8042:	ff 77 04             	push   0x4(%edi)
    8045:	ff 37                	push   (%edi)
    8047:	56                   	push   %esi
    8048:	e8 93 a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    804d:	83 c4 0c             	add    $0xc,%esp
    8050:	89 c7                	mov    %eax,%edi
    8052:	8d 83 77 c2 ff ff    	lea    -0x3d89(%ebx),%eax
    8058:	6a 0c                	push   $0xc
    805a:	50                   	push   %eax
    805b:	57                   	push   %edi
    805c:	e8 7f a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8061:	89 3c 24             	mov    %edi,(%esp)
    8064:	e8 a7 a0 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8069:	89 04 24             	mov    %eax,(%esp)
    806c:	e8 9f a0 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8071:	83 c4 0c             	add    $0xc,%esp
    8074:	ff 75 84             	push   -0x7c(%ebp)
    8077:	ff 75 80             	push   -0x80(%ebp)
    807a:	56                   	push   %esi
    807b:	e8 60 a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8080:	83 c4 0c             	add    $0xc,%esp
    8083:	8d 8b 84 c2 ff ff    	lea    -0x3d7c(%ebx),%ecx
    8089:	89 c7                	mov    %eax,%edi
    808b:	6a 0b                	push   $0xb
    808d:	51                   	push   %ecx
    808e:	50                   	push   %eax
    808f:	e8 4c a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8094:	83 c4 0c             	add    $0xc,%esp
    8097:	ff 75 9c             	push   -0x64(%ebp)
    809a:	ff 75 98             	push   -0x68(%ebp)
    809d:	57                   	push   %edi
    809e:	e8 3d a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    80a3:	89 04 24             	mov    %eax,(%esp)
    80a6:	e8 65 a0 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    80ab:	83 c4 0c             	add    $0xc,%esp
    80ae:	8d 93 90 c2 ff ff    	lea    -0x3d70(%ebx),%edx
    80b4:	6a 1b                	push   $0x1b
    80b6:	52                   	push   %edx
    80b7:	56                   	push   %esi
    80b8:	e8 23 a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    80bd:	89 34 24             	mov    %esi,(%esp)
    80c0:	e8 4b a0 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    80c5:	89 04 24             	mov    %eax,(%esp)
    80c8:	e8 43 a0 ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    80cd:	83 c4 0c             	add    $0xc,%esp
    80d0:	ff 75 b4             	push   -0x4c(%ebp)
    80d3:	ff 75 b0             	push   -0x50(%ebp)
    80d6:	56                   	push   %esi
    80d7:	e8 04 a2 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    80dc:	83 c4 0c             	add    $0xc,%esp
    80df:	89 c7                	mov    %eax,%edi
    80e1:	8d 83 ac c2 ff ff    	lea    -0x3d54(%ebx),%eax
    80e7:	6a 0a                	push   $0xa
    80e9:	50                   	push   %eax
    80ea:	57                   	push   %edi
    80eb:	e8 f0 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    80f0:	83 c4 0c             	add    $0xc,%esp
    80f3:	ff 75 cc             	push   -0x34(%ebp)
    80f6:	ff 75 c8             	push   -0x38(%ebp)
    80f9:	57                   	push   %edi
    80fa:	e8 e1 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    80ff:	83 c4 0c             	add    $0xc,%esp
    8102:	8d 8b b7 c2 ff ff    	lea    -0x3d49(%ebx),%ecx
    8108:	6a 0c                	push   $0xc
    810a:	51                   	push   %ecx
    810b:	56                   	push   %esi
    810c:	e8 cf a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8111:	89 34 24             	mov    %esi,(%esp)
    8114:	e8 f7 9f ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8119:	89 04 24             	mov    %eax,(%esp)
    811c:	e8 ef 9f ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8121:	83 c4 0c             	add    $0xc,%esp
    8124:	ff 75 b4             	push   -0x4c(%ebp)
    8127:	ff 75 b0             	push   -0x50(%ebp)
    812a:	56                   	push   %esi
    812b:	e8 b0 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8130:	83 c4 0c             	add    $0xc,%esp
    8133:	8d 93 c4 c2 ff ff    	lea    -0x3d3c(%ebx),%edx
    8139:	89 c7                	mov    %eax,%edi
    813b:	6a 0d                	push   $0xd
    813d:	52                   	push   %edx
    813e:	50                   	push   %eax
    813f:	e8 9c a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8144:	83 c4 0c             	add    $0xc,%esp
    8147:	ff 75 cc             	push   -0x34(%ebp)
    814a:	ff 75 c8             	push   -0x38(%ebp)
    814d:	57                   	push   %edi
    814e:	e8 8d a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8153:	83 c4 0c             	add    $0xc,%esp
    8156:	8d 83 d2 c2 ff ff    	lea    -0x3d2e(%ebx),%eax
    815c:	6a 0d                	push   $0xd
    815e:	50                   	push   %eax
    815f:	56                   	push   %esi
    8160:	e8 7b a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8165:	89 34 24             	mov    %esi,(%esp)
    8168:	e8 a3 9f ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    816d:	89 04 24             	mov    %eax,(%esp)
    8170:	e8 9b 9f ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8175:	83 c4 0c             	add    $0xc,%esp
    8178:	ff 75 b4             	push   -0x4c(%ebp)
    817b:	ff 75 b0             	push   -0x50(%ebp)
    817e:	56                   	push   %esi
    817f:	e8 5c a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8184:	83 c4 0c             	add    $0xc,%esp
    8187:	8d 8b e0 c2 ff ff    	lea    -0x3d20(%ebx),%ecx
    818d:	89 c7                	mov    %eax,%edi
    818f:	6a 0a                	push   $0xa
    8191:	51                   	push   %ecx
    8192:	50                   	push   %eax
    8193:	e8 48 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8198:	83 c4 0c             	add    $0xc,%esp
    819b:	ff 75 cc             	push   -0x34(%ebp)
    819e:	ff 75 c8             	push   -0x38(%ebp)
    81a1:	57                   	push   %edi
    81a2:	e8 39 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    81a7:	83 c4 0c             	add    $0xc,%esp
    81aa:	8d 93 eb c2 ff ff    	lea    -0x3d15(%ebx),%edx
    81b0:	6a 10                	push   $0x10
    81b2:	52                   	push   %edx
    81b3:	56                   	push   %esi
    81b4:	e8 27 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    81b9:	89 34 24             	mov    %esi,(%esp)
    81bc:	e8 4f 9f ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    81c1:	89 04 24             	mov    %eax,(%esp)
    81c4:	e8 47 9f ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    81c9:	83 c4 0c             	add    $0xc,%esp
    81cc:	ff 75 b4             	push   -0x4c(%ebp)
    81cf:	ff 75 b0             	push   -0x50(%ebp)
    81d2:	56                   	push   %esi
    81d3:	e8 08 a1 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    81d8:	83 c4 0c             	add    $0xc,%esp
    81db:	89 c7                	mov    %eax,%edi
    81dd:	8d 83 fc c2 ff ff    	lea    -0x3d04(%ebx),%eax
    81e3:	6a 10                	push   $0x10
    81e5:	50                   	push   %eax
    81e6:	57                   	push   %edi
    81e7:	e8 f4 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    81ec:	83 c4 0c             	add    $0xc,%esp
    81ef:	ff 75 cc             	push   -0x34(%ebp)
    81f2:	ff 75 c8             	push   -0x38(%ebp)
    81f5:	57                   	push   %edi
    81f6:	e8 e5 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    81fb:	83 c4 0c             	add    $0xc,%esp
    81fe:	8d 8b 0d c3 ff ff    	lea    -0x3cf3(%ebx),%ecx
    8204:	6a 1c                	push   $0x1c
    8206:	51                   	push   %ecx
    8207:	56                   	push   %esi
    8208:	e8 d3 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    820d:	89 34 24             	mov    %esi,(%esp)
    8210:	e8 fb 9e ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8215:	89 04 24             	mov    %eax,(%esp)
    8218:	e8 f3 9e ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    821d:	83 c4 0c             	add    $0xc,%esp
    8220:	ff 75 b4             	push   -0x4c(%ebp)
    8223:	ff 75 b0             	push   -0x50(%ebp)
    8226:	56                   	push   %esi
    8227:	e8 b4 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    822c:	83 c4 0c             	add    $0xc,%esp
    822f:	8d 93 2a c3 ff ff    	lea    -0x3cd6(%ebx),%edx
    8235:	89 c7                	mov    %eax,%edi
    8237:	6a 11                	push   $0x11
    8239:	52                   	push   %edx
    823a:	50                   	push   %eax
    823b:	e8 a0 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8240:	83 c4 0c             	add    $0xc,%esp
    8243:	ff 75 cc             	push   -0x34(%ebp)
    8246:	ff 75 c8             	push   -0x38(%ebp)
    8249:	57                   	push   %edi
    824a:	e8 91 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    824f:	83 c4 0c             	add    $0xc,%esp
    8252:	8d 83 3c c3 ff ff    	lea    -0x3cc4(%ebx),%eax
    8258:	6a 1c                	push   $0x1c
    825a:	50                   	push   %eax
    825b:	56                   	push   %esi
    825c:	e8 7f a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8261:	89 34 24             	mov    %esi,(%esp)
    8264:	e8 a7 9e ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8269:	89 04 24             	mov    %eax,(%esp)
    826c:	e8 9f 9e ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8271:	83 c4 0c             	add    $0xc,%esp
    8274:	ff 75 b4             	push   -0x4c(%ebp)
    8277:	ff 75 b0             	push   -0x50(%ebp)
    827a:	56                   	push   %esi
    827b:	e8 60 a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8280:	83 c4 0c             	add    $0xc,%esp
    8283:	8d 8b 59 c3 ff ff    	lea    -0x3ca7(%ebx),%ecx
    8289:	89 c7                	mov    %eax,%edi
    828b:	6a 0e                	push   $0xe
    828d:	51                   	push   %ecx
    828e:	50                   	push   %eax
    828f:	e8 4c a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8294:	83 c4 0c             	add    $0xc,%esp
    8297:	ff 75 cc             	push   -0x34(%ebp)
    829a:	ff 75 c8             	push   -0x38(%ebp)
    829d:	57                   	push   %edi
    829e:	e8 3d a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    82a3:	83 c4 0c             	add    $0xc,%esp
    82a6:	8d 93 68 c3 ff ff    	lea    -0x3c98(%ebx),%edx
    82ac:	6a 0e                	push   $0xe
    82ae:	52                   	push   %edx
    82af:	56                   	push   %esi
    82b0:	e8 2b a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    82b5:	89 34 24             	mov    %esi,(%esp)
    82b8:	e8 53 9e ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    82bd:	89 04 24             	mov    %eax,(%esp)
    82c0:	e8 4b 9e ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    82c5:	83 c4 0c             	add    $0xc,%esp
    82c8:	ff 75 b4             	push   -0x4c(%ebp)
    82cb:	ff 75 b0             	push   -0x50(%ebp)
    82ce:	56                   	push   %esi
    82cf:	e8 0c a0 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    82d4:	83 c4 0c             	add    $0xc,%esp
    82d7:	89 c7                	mov    %eax,%edi
    82d9:	8d 83 77 c3 ff ff    	lea    -0x3c89(%ebx),%eax
    82df:	6a 0a                	push   $0xa
    82e1:	50                   	push   %eax
    82e2:	57                   	push   %edi
    82e3:	e8 f8 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    82e8:	83 c4 0c             	add    $0xc,%esp
    82eb:	ff 75 cc             	push   -0x34(%ebp)
    82ee:	ff 75 c8             	push   -0x38(%ebp)
    82f1:	57                   	push   %edi
    82f2:	e8 e9 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    82f7:	83 c4 0c             	add    $0xc,%esp
    82fa:	8d 8b 82 c3 ff ff    	lea    -0x3c7e(%ebx),%ecx
    8300:	6a 15                	push   $0x15
    8302:	51                   	push   %ecx
    8303:	56                   	push   %esi
    8304:	e8 d7 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8309:	89 34 24             	mov    %esi,(%esp)
    830c:	e8 ff 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8311:	89 04 24             	mov    %eax,(%esp)
    8314:	e8 f7 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8319:	83 c4 0c             	add    $0xc,%esp
    831c:	ff 75 b4             	push   -0x4c(%ebp)
    831f:	ff 75 b0             	push   -0x50(%ebp)
    8322:	56                   	push   %esi
    8323:	e8 b8 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8328:	83 c4 0c             	add    $0xc,%esp
    832b:	8d 93 98 c3 ff ff    	lea    -0x3c68(%ebx),%edx
    8331:	89 c7                	mov    %eax,%edi
    8333:	6a 0b                	push   $0xb
    8335:	52                   	push   %edx
    8336:	50                   	push   %eax
    8337:	e8 a4 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    833c:	83 c4 0c             	add    $0xc,%esp
    833f:	ff 75 cc             	push   -0x34(%ebp)
    8342:	ff 75 c8             	push   -0x38(%ebp)
    8345:	57                   	push   %edi
    8346:	e8 95 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    834b:	83 c4 0c             	add    $0xc,%esp
    834e:	8d 83 28 ca ff ff    	lea    -0x35d8(%ebx),%eax
    8354:	6a 2a                	push   $0x2a
    8356:	50                   	push   %eax
    8357:	56                   	push   %esi
    8358:	e8 83 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    835d:	89 34 24             	mov    %esi,(%esp)
    8360:	e8 ab 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8365:	89 04 24             	mov    %eax,(%esp)
    8368:	e8 a3 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    836d:	83 c4 0c             	add    $0xc,%esp
    8370:	ff 75 b4             	push   -0x4c(%ebp)
    8373:	ff 75 b0             	push   -0x50(%ebp)
    8376:	56                   	push   %esi
    8377:	e8 64 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    837c:	83 c4 0c             	add    $0xc,%esp
    837f:	8d 8b a4 c3 ff ff    	lea    -0x3c5c(%ebx),%ecx
    8385:	89 c7                	mov    %eax,%edi
    8387:	6a 12                	push   $0x12
    8389:	51                   	push   %ecx
    838a:	50                   	push   %eax
    838b:	e8 50 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8390:	83 c4 0c             	add    $0xc,%esp
    8393:	ff 75 cc             	push   -0x34(%ebp)
    8396:	ff 75 c8             	push   -0x38(%ebp)
    8399:	57                   	push   %edi
    839a:	e8 41 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    839f:	83 c4 0c             	add    $0xc,%esp
    83a2:	8d 93 54 ca ff ff    	lea    -0x35ac(%ebx),%edx
    83a8:	6a 26                	push   $0x26
    83aa:	52                   	push   %edx
    83ab:	56                   	push   %esi
    83ac:	e8 2f 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    83b1:	89 34 24             	mov    %esi,(%esp)
    83b4:	e8 57 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    83b9:	89 04 24             	mov    %eax,(%esp)
    83bc:	e8 4f 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    83c1:	83 c4 0c             	add    $0xc,%esp
    83c4:	ff 75 b4             	push   -0x4c(%ebp)
    83c7:	ff 75 b0             	push   -0x50(%ebp)
    83ca:	56                   	push   %esi
    83cb:	e8 10 9f ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    83d0:	83 c4 0c             	add    $0xc,%esp
    83d3:	8d 8b b7 c3 ff ff    	lea    -0x3c49(%ebx),%ecx
    83d9:	89 c7                	mov    %eax,%edi
    83db:	6a 0d                	push   $0xd
    83dd:	51                   	push   %ecx
    83de:	50                   	push   %eax
    83df:	e8 fc 9e ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    83e4:	83 c4 0c             	add    $0xc,%esp
    83e7:	ff 75 cc             	push   -0x34(%ebp)
    83ea:	ff 75 c8             	push   -0x38(%ebp)
    83ed:	57                   	push   %edi
    83ee:	e8 ed 9e ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    83f3:	83 c4 0c             	add    $0xc,%esp
    83f6:	8d bb c5 c3 ff ff    	lea    -0x3c3b(%ebx),%edi
    83fc:	6a 0f                	push   $0xf
    83fe:	57                   	push   %edi
    83ff:	56                   	push   %esi
    8400:	e8 db 9e ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    8405:	89 34 24             	mov    %esi,(%esp)
    8408:	e8 03 9d ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    840d:	89 04 24             	mov    %eax,(%esp)
    8410:	e8 fb 9c ff ff       	call   2110 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    8415:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    841c:	e8 0f 9f ff ff       	call   2330 <exit@plt>
    8421:	8d 55 c8             	lea    -0x38(%ebp),%edx
    8424:	40                   	inc    %eax
    8425:	6a ff                	push   $0xffffffff
    8427:	50                   	push   %eax
    8428:	57                   	push   %edi
    8429:	52                   	push   %edx
    842a:	89 95 70 ff ff ff    	mov    %edx,-0x90(%ebp)
    8430:	e8 7b 9c ff ff       	call   20b0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEjj@plt>
    8435:	8b 75 c8             	mov    -0x38(%ebp),%esi
    8438:	8d 4d d0             	lea    -0x30(%ebp),%ecx
    843b:	8b 07                	mov    (%edi),%eax
    843d:	83 c4 0c             	add    $0xc,%esp
    8440:	83 c7 08             	add    $0x8,%edi
    8443:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
    8449:	39 ce                	cmp    %ecx,%esi
    844b:	74 57                	je     84a4 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5d4>
    844d:	c5 fa 7e 45 cc       	vmovq  -0x34(%ebp),%xmm0
    8452:	39 f8                	cmp    %edi,%eax
    8454:	74 3c                	je     8492 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5c2>
    8456:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
    845c:	8b 7b 08             	mov    0x8(%ebx),%edi
    845f:	89 33                	mov    %esi,(%ebx)
    8461:	c5 f9 d6 43 04       	vmovq  %xmm0,0x4(%ebx)
    8466:	85 c0                	test   %eax,%eax
    8468:	74 35                	je     849f <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5cf>
    846a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    846d:	89 7d d0             	mov    %edi,-0x30(%ebp)
    8470:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8473:	8b 9d 6c ff ff ff    	mov    -0x94(%ebp),%ebx
    8479:	83 ec 0c             	sub    $0xc,%esp
    847c:	31 c0                	xor    %eax,%eax
    847e:	89 45 cc             	mov    %eax,-0x34(%ebp)
    8481:	c6 01 00             	movb   $0x0,(%ecx)
    8484:	52                   	push   %edx
    8485:	e8 26 9e ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    848a:	83 c4 10             	add    $0x10,%esp
    848d:	e9 8c fa ff ff       	jmp    7f1e <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4e>
    8492:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    8498:	c5 f9 d6 40 04       	vmovq  %xmm0,0x4(%eax)
    849d:	89 30                	mov    %esi,(%eax)
    849f:	89 4d c8             	mov    %ecx,-0x38(%ebp)
    84a2:	eb cc                	jmp    8470 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5a0>
    84a4:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    84a7:	85 c9                	test   %ecx,%ecx
    84a9:	74 14                	je     84bf <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5ef>
    84ab:	83 f9 01             	cmp    $0x1,%ecx
    84ae:	74 1e                	je     84ce <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5fe>
    84b0:	89 c7                	mov    %eax,%edi
    84b2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
    84b4:	8b b5 74 ff ff ff    	mov    -0x8c(%ebp),%esi
    84ba:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    84bd:	8b 06                	mov    (%esi),%eax
    84bf:	8b b5 74 ff ff ff    	mov    -0x8c(%ebp),%esi
    84c5:	89 4e 04             	mov    %ecx,0x4(%esi)
    84c8:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
    84cc:	eb a2                	jmp    8470 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5a0>
    84ce:	0f b6 5d d0          	movzbl -0x30(%ebp),%ebx
    84d2:	8b bd 74 ff ff ff    	mov    -0x8c(%ebp),%edi
    84d8:	88 18                	mov    %bl,(%eax)
    84da:	8b 07                	mov    (%edi),%eax
    84dc:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    84df:	eb de                	jmp    84bf <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x5ef>
    84e1:	89 c6                	mov    %eax,%esi
    84e3:	e9 62 a0 ff ff       	jmp    254a <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    84e8:	89 c6                	mov    %eax,%esi
    84ea:	c5 f8 77             	vzeroupper
    84ed:	e9 72 a0 ff ff       	jmp    2564 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x1a>
    84f2:	89 c6                	mov    %eax,%esi
    84f4:	c5 f8 77             	vzeroupper
    84f7:	e9 7f a0 ff ff       	jmp    257b <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x31>
    84fc:	89 c6                	mov    %eax,%esi
    84fe:	c5 f8 77             	vzeroupper
    8501:	e9 8c a0 ff ff       	jmp    2592 <_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x48>
    8506:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    850d:	00 
    850e:	66 90                	xchg   %ax,%ax

00008510 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc>:
    8510:	55                   	push   %ebp
    8511:	89 e5                	mov    %esp,%ebp
    8513:	57                   	push   %edi
    8514:	56                   	push   %esi
    8515:	53                   	push   %ebx
    8516:	81 ec 4c 01 00 00    	sub    $0x14c,%esp
    851c:	8b 7d 0c             	mov    0xc(%ebp),%edi
    851f:	8b 55 08             	mov    0x8(%ebp),%edx
    8522:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8525:	8d 9d 08 ff ff ff    	lea    -0xf8(%ebp),%ebx
    852b:	e8 ad d4 ff ff       	call   59dd <__x86.get_pc_thunk.ax>
    8530:	05 8c 69 00 00       	add    $0x698c,%eax
    8535:	89 95 ec fe ff ff    	mov    %edx,-0x114(%ebp)
    853b:	89 8d f0 fe ff ff    	mov    %ecx,-0x110(%ebp)
    8541:	8b 77 04             	mov    0x4(%edi),%esi
    8544:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
    854a:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    8550:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8553:	31 c0                	xor    %eax,%eax
    8555:	89 9d c8 fe ff ff    	mov    %ebx,-0x138(%ebp)
    855b:	89 9d 00 ff ff ff    	mov    %ebx,-0x100(%ebp)
    8561:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
    8568:	00 00 00 
    856b:	c6 85 08 ff ff ff 00 	movb   $0x0,-0xf8(%ebp)
    8572:	85 f6                	test   %esi,%esi
    8574:	0f 84 12 04 00 00    	je     898c <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x47c>
    857a:	8b 07                	mov    (%edi),%eax
    857c:	80 38 3d             	cmpb   $0x3d,(%eax)
    857f:	0f 84 7a 04 00 00    	je     89ff <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x4ef>
    8585:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    858b:	83 ec 0c             	sub    $0xc,%esp
    858e:	8d 8d 5c ff ff ff    	lea    -0xa4(%ebp),%ecx
    8594:	8d b5 18 ff ff ff    	lea    -0xe8(%ebp),%esi
    859a:	89 8d d0 fe ff ff    	mov    %ecx,-0x130(%ebp)
    85a0:	89 b5 dc fe ff ff    	mov    %esi,-0x124(%ebp)
    85a6:	51                   	push   %ecx
    85a7:	e8 e4 9a ff ff       	call   2090 <_ZNSt8ios_baseC2Ev@plt>
    85ac:	8b 93 1c 01 00 00    	mov    0x11c(%ebx),%edx
    85b2:	8b 83 08 01 00 00    	mov    0x108(%ebx),%eax
    85b8:	66 c7 45 d0 00 00    	movw   $0x0,-0x30(%ebp)
    85be:	c5 f9 ef c0          	vpxor  %xmm0,%xmm0,%xmm0
    85c2:	c5 fa 7f 45 d4       	vmovdqu %xmm0,-0x2c(%ebp)
    85c7:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    85ce:	8b 4a 04             	mov    0x4(%edx),%ecx
    85d1:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%ebp)
    85d7:	83 c0 08             	add    $0x8,%eax
    85da:	8b 52 08             	mov    0x8(%edx),%edx
    85dd:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
    85e3:	8b 41 f4             	mov    -0xc(%ecx),%eax
    85e6:	89 8d 18 ff ff ff    	mov    %ecx,-0xe8(%ebp)
    85ec:	89 8d bc fe ff ff    	mov    %ecx,-0x144(%ebp)
    85f2:	89 95 b8 fe ff ff    	mov    %edx,-0x148(%ebp)
    85f8:	89 94 05 18 ff ff ff 	mov    %edx,-0xe8(%ebp,%eax,1)
    85ff:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
    8606:	00 00 00 
    8609:	8b 49 f4             	mov    -0xc(%ecx),%ecx
    860c:	58                   	pop    %eax
    860d:	5a                   	pop    %edx
    860e:	6a 00                	push   $0x0
    8610:	01 f1                	add    %esi,%ecx
    8612:	51                   	push   %ecx
    8613:	e8 d8 9c ff ff       	call   22f0 <_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@plt>
    8618:	8b b3 0c 01 00 00    	mov    0x10c(%ebx),%esi
    861e:	8b 8b 18 01 00 00    	mov    0x118(%ebx),%ecx
    8624:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
    862b:	00 00 00 
    862e:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
    8635:	00 00 00 
    8638:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%ebp)
    863f:	00 00 00 
    8642:	c7 85 30 ff ff ff 00 	movl   $0x0,-0xd0(%ebp)
    8649:	00 00 00 
    864c:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
    8653:	00 00 00 
    8656:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
    865d:	00 00 00 
    8660:	8d 56 0c             	lea    0xc(%esi),%edx
    8663:	8d 46 20             	lea    0x20(%esi),%eax
    8666:	89 b5 ac fe ff ff    	mov    %esi,-0x154(%ebp)
    866c:	89 8d c4 fe ff ff    	mov    %ecx,-0x13c(%ebp)
    8672:	8d b5 3c ff ff ff    	lea    -0xc4(%ebp),%esi
    8678:	83 c1 08             	add    $0x8,%ecx
    867b:	89 95 18 ff ff ff    	mov    %edx,-0xe8(%ebp)
    8681:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
    8687:	89 8d 20 ff ff ff    	mov    %ecx,-0xe0(%ebp)
    868d:	89 b5 c0 fe ff ff    	mov    %esi,-0x140(%ebp)
    8693:	89 34 24             	mov    %esi,(%esp)
    8696:	e8 65 9d ff ff       	call   2400 <_ZNSt6localeC1Ev@plt>
    869b:	8b 9b 40 01 00 00    	mov    0x140(%ebx),%ebx
    86a1:	8b 77 04             	mov    0x4(%edi),%esi
    86a4:	83 c4 10             	add    $0x10,%esp
    86a7:	8d 95 4c ff ff ff    	lea    -0xb4(%ebp),%edx
    86ad:	8b 3f                	mov    (%edi),%edi
    86af:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
    86b6:	00 00 00 
    86b9:	89 95 cc fe ff ff    	mov    %edx,-0x134(%ebp)
    86bf:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
    86c5:	89 9d b0 fe ff ff    	mov    %ebx,-0x150(%ebp)
    86cb:	83 c3 08             	add    $0x8,%ebx
    86ce:	85 ff                	test   %edi,%edi
    86d0:	89 9d 20 ff ff ff    	mov    %ebx,-0xe0(%ebp)
    86d6:	0f 94 c1             	sete   %cl
    86d9:	85 f6                	test   %esi,%esi
    86db:	0f 95 c0             	setne  %al
    86de:	84 c1                	test   %al,%cl
    86e0:	0f 85 d7 03 00 00    	jne    8abd <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x5ad>
    86e6:	89 b5 fc fe ff ff    	mov    %esi,-0x104(%ebp)
    86ec:	83 fe 0f             	cmp    $0xf,%esi
    86ef:	0f 87 2e 03 00 00    	ja     8a23 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x513>
    86f5:	83 fe 01             	cmp    $0x1,%esi
    86f8:	0f 85 a6 02 00 00    	jne    89a4 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x494>
    86fe:	0f b6 1f             	movzbl (%edi),%ebx
    8701:	88 9d 4c ff ff ff    	mov    %bl,-0xb4(%ebp)
    8707:	8b bd cc fe ff ff    	mov    -0x134(%ebp),%edi
    870d:	89 b5 48 ff ff ff    	mov    %esi,-0xb8(%ebp)
    8713:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8719:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
    871d:	c7 85 40 ff ff ff 08 	movl   $0x8,-0xc0(%ebp)
    8724:	00 00 00 
    8727:	6a 00                	push   $0x0
    8729:	6a 00                	push   $0x0
    872b:	ff b5 44 ff ff ff    	push   -0xbc(%ebp)
    8731:	8d b5 20 ff ff ff    	lea    -0xe0(%ebp),%esi
    8737:	56                   	push   %esi
    8738:	e8 23 99 ff ff       	call   2060 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE7_M_syncEPcjj@plt>
    873d:	5f                   	pop    %edi
    873e:	58                   	pop    %eax
    873f:	56                   	push   %esi
    8740:	ff b5 d0 fe ff ff    	push   -0x130(%ebp)
    8746:	e8 a5 9b ff ff       	call   22f0 <_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@plt>
    874b:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
    8751:	0f be 85 f0 fe ff ff 	movsbl -0x110(%ebp),%eax
    8758:	8d 95 00 ff ff ff    	lea    -0x100(%ebp),%edx
    875e:	8d 8d fc fe ff ff    	lea    -0x104(%ebp),%ecx
    8764:	83 c4 10             	add    $0x10,%esp
    8767:	89 95 e0 fe ff ff    	mov    %edx,-0x120(%ebp)
    876d:	89 8d d4 fe ff ff    	mov    %ecx,-0x12c(%ebp)
    8773:	83 c3 04             	add    $0x4,%ebx
    8776:	89 85 d8 fe ff ff    	mov    %eax,-0x128(%ebp)
    877c:	89 9d e4 fe ff ff    	mov    %ebx,-0x11c(%ebp)
    8782:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8789:	00 
    878a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    8790:	83 ec 04             	sub    $0x4,%esp
    8793:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8799:	ff b5 d8 fe ff ff    	push   -0x128(%ebp)
    879f:	ff b5 e0 fe ff ff    	push   -0x120(%ebp)
    87a5:	ff b5 dc fe ff ff    	push   -0x124(%ebp)
    87ab:	e8 30 9c ff ff       	call   23e0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
    87b0:	8b 38                	mov    (%eax),%edi
    87b2:	83 c4 10             	add    $0x10,%esp
    87b5:	8b 77 f4             	mov    -0xc(%edi),%esi
    87b8:	f6 44 30 14 05       	testb  $0x5,0x14(%eax,%esi,1)
    87bd:	0f 85 fd 00 00 00    	jne    88c0 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x3b0>
    87c3:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    87c9:	8b b5 00 ff ff ff    	mov    -0x100(%ebp),%esi
    87cf:	e8 3c 9a ff ff       	call   2210 <__errno_location@plt>
    87d4:	83 ec 04             	sub    $0x4,%esp
    87d7:	8b 08                	mov    (%eax),%ecx
    87d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    87df:	89 c7                	mov    %eax,%edi
    87e1:	89 8d e8 fe ff ff    	mov    %ecx,-0x118(%ebp)
    87e7:	6a 0a                	push   $0xa
    87e9:	ff b5 d4 fe ff ff    	push   -0x12c(%ebp)
    87ef:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
    87f5:	56                   	push   %esi
    87f6:	e8 f5 9b ff ff       	call   23f0 <__isoc23_strtol@plt>
    87fb:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
    8801:	83 c4 10             	add    $0x10,%esp
    8804:	89 c6                	mov    %eax,%esi
    8806:	3b 9d fc fe ff ff    	cmp    -0x104(%ebp),%ebx
    880c:	0f 84 69 02 00 00    	je     8a7b <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x56b>
    8812:	8b 17                	mov    (%edi),%edx
    8814:	83 fa 22             	cmp    $0x22,%edx
    8817:	0f 84 7f 02 00 00    	je     8a9c <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x58c>
    881d:	85 d2                	test   %edx,%edx
    881f:	75 08                	jne    8829 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x319>
    8821:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
    8827:	89 07                	mov    %eax,(%edi)
    8829:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
    882f:	8b 7f 08             	mov    0x8(%edi),%edi
    8832:	85 ff                	test   %edi,%edi
    8834:	75 0c                	jne    8842 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x332>
    8836:	e9 85 01 00 00       	jmp    89c0 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x4b0>
    883b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    8840:	89 df                	mov    %ebx,%edi
    8842:	8b 47 10             	mov    0x10(%edi),%eax
    8845:	8b 5f 0c             	mov    0xc(%edi),%ebx
    8848:	39 c6                	cmp    %eax,%esi
    884a:	0f 42 5f 08          	cmovb  0x8(%edi),%ebx
    884e:	0f 92 c1             	setb   %cl
    8851:	85 db                	test   %ebx,%ebx
    8853:	75 eb                	jne    8840 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x330>
    8855:	84 c9                	test   %cl,%cl
    8857:	0f 85 69 01 00 00    	jne    89c6 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x4b6>
    885d:	39 f0                	cmp    %esi,%eax
    885f:	0f 83 2b ff ff ff    	jae    8790 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x280>
    8865:	8b 9d e4 fe ff ff    	mov    -0x11c(%ebp),%ebx
    886b:	c6 85 f0 fe ff ff 01 	movb   $0x1,-0x110(%ebp)
    8872:	39 df                	cmp    %ebx,%edi
    8874:	0f 85 76 01 00 00    	jne    89f0 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x4e0>
    887a:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8880:	83 ec 0c             	sub    $0xc,%esp
    8883:	6a 14                	push   $0x14
    8885:	e8 c6 97 ff ff       	call   2050 <_Znwj@plt>
    888a:	83 c4 10             	add    $0x10,%esp
    888d:	89 70 10             	mov    %esi,0x10(%eax)
    8890:	0f b6 b5 f0 fe ff ff 	movzbl -0x110(%ebp),%esi
    8897:	ff b5 e4 fe ff ff    	push   -0x11c(%ebp)
    889d:	57                   	push   %edi
    889e:	50                   	push   %eax
    889f:	56                   	push   %esi
    88a0:	e8 cb 97 ff ff       	call   2070 <_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@plt>
    88a5:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
    88ab:	83 c4 10             	add    $0x10,%esp
    88ae:	ff 47 14             	incl   0x14(%edi)
    88b1:	e9 da fe ff ff       	jmp    8790 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x280>
    88b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    88bd:	00 
    88be:	66 90                	xchg   %ax,%ax
    88c0:	8b 95 ac fe ff ff    	mov    -0x154(%ebp),%edx
    88c6:	8b 9d b0 fe ff ff    	mov    -0x150(%ebp),%ebx
    88cc:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
    88d2:	8b b5 cc fe ff ff    	mov    -0x134(%ebp),%esi
    88d8:	8d 42 0c             	lea    0xc(%edx),%eax
    88db:	8d 4a 20             	lea    0x20(%edx),%ecx
    88de:	83 c3 08             	add    $0x8,%ebx
    88e1:	89 85 18 ff ff ff    	mov    %eax,-0xe8(%ebp)
    88e7:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
    88ed:	89 9d 20 ff ff ff    	mov    %ebx,-0xe0(%ebp)
    88f3:	39 f7                	cmp    %esi,%edi
    88f5:	74 12                	je     8909 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x3f9>
    88f7:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    88fd:	83 ec 0c             	sub    $0xc,%esp
    8900:	57                   	push   %edi
    8901:	e8 4a 99 ff ff       	call   2250 <_ZdlPv@plt>
    8906:	83 c4 10             	add    $0x10,%esp
    8909:	8b 95 c4 fe ff ff    	mov    -0x13c(%ebp),%edx
    890f:	83 ec 0c             	sub    $0xc,%esp
    8912:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8918:	83 c2 08             	add    $0x8,%edx
    891b:	89 95 20 ff ff ff    	mov    %edx,-0xe0(%ebp)
    8921:	ff b5 c0 fe ff ff    	push   -0x140(%ebp)
    8927:	e8 e4 99 ff ff       	call   2310 <_ZNSt6localeD1Ev@plt>
    892c:	8b 85 bc fe ff ff    	mov    -0x144(%ebp),%eax
    8932:	8b b5 b4 fe ff ff    	mov    -0x14c(%ebp),%esi
    8938:	8b 8d b8 fe ff ff    	mov    -0x148(%ebp),%ecx
    893e:	8b 78 f4             	mov    -0xc(%eax),%edi
    8941:	83 c6 08             	add    $0x8,%esi
    8944:	89 85 18 ff ff ff    	mov    %eax,-0xe8(%ebp)
    894a:	89 8c 3d 18 ff ff ff 	mov    %ecx,-0xe8(%ebp,%edi,1)
    8951:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
    8958:	00 00 00 
    895b:	89 b5 5c ff ff ff    	mov    %esi,-0xa4(%ebp)
    8961:	58                   	pop    %eax
    8962:	ff b5 d0 fe ff ff    	push   -0x130(%ebp)
    8968:	e8 33 97 ff ff       	call   20a0 <_ZNSt8ios_baseD2Ev@plt>
    896d:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
    8973:	8b 85 c8 fe ff ff    	mov    -0x138(%ebp),%eax
    8979:	83 c4 10             	add    $0x10,%esp
    897c:	39 c2                	cmp    %eax,%edx
    897e:	74 0c                	je     898c <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x47c>
    8980:	83 ec 0c             	sub    $0xc,%esp
    8983:	52                   	push   %edx
    8984:	e8 c7 98 ff ff       	call   2250 <_ZdlPv@plt>
    8989:	83 c4 10             	add    $0x10,%esp
    898c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    898f:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    8996:	0f 85 42 01 00 00    	jne    8ade <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x5ce>
    899c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    899f:	5b                   	pop    %ebx
    89a0:	5e                   	pop    %esi
    89a1:	5f                   	pop    %edi
    89a2:	5d                   	pop    %ebp
    89a3:	c3                   	ret
    89a4:	85 f6                	test   %esi,%esi
    89a6:	0f 84 5b fd ff ff    	je     8707 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x1f7>
    89ac:	8b 85 cc fe ff ff    	mov    -0x134(%ebp),%eax
    89b2:	e9 9f 00 00 00       	jmp    8a56 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x546>
    89b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    89be:	00 
    89bf:	90                   	nop
    89c0:	8b bd e4 fe ff ff    	mov    -0x11c(%ebp),%edi
    89c6:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
    89cc:	3b 7a 0c             	cmp    0xc(%edx),%edi
    89cf:	0f 84 90 fe ff ff    	je     8865 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x355>
    89d5:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    89db:	83 ec 0c             	sub    $0xc,%esp
    89de:	57                   	push   %edi
    89df:	e8 9c 98 ff ff       	call   2280 <_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@plt>
    89e4:	83 c4 10             	add    $0x10,%esp
    89e7:	8b 40 10             	mov    0x10(%eax),%eax
    89ea:	e9 6e fe ff ff       	jmp    885d <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x34d>
    89ef:	90                   	nop
    89f0:	3b 77 10             	cmp    0x10(%edi),%esi
    89f3:	0f 92 85 f0 fe ff ff 	setb   -0x110(%ebp)
    89fa:	e9 7b fe ff ff       	jmp    887a <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x36a>
    89ff:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8a05:	83 ec 0c             	sub    $0xc,%esp
    8a08:	6a 00                	push   $0x0
    8a0a:	8d 93 68 c2 ff ff    	lea    -0x3d98(%ebx),%edx
    8a10:	52                   	push   %edx
    8a11:	6a 01                	push   $0x1
    8a13:	6a 00                	push   $0x0
    8a15:	57                   	push   %edi
    8a16:	e8 c5 96 ff ff       	call   20e0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEjjPKcj@plt>
    8a1b:	83 c4 20             	add    $0x20,%esp
    8a1e:	e9 62 fb ff ff       	jmp    8585 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x75>
    8a23:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8a29:	83 ec 04             	sub    $0x4,%esp
    8a2c:	8d 95 fc fe ff ff    	lea    -0x104(%ebp),%edx
    8a32:	8d 8d 44 ff ff ff    	lea    -0xbc(%ebp),%ecx
    8a38:	6a 00                	push   $0x0
    8a3a:	52                   	push   %edx
    8a3b:	51                   	push   %ecx
    8a3c:	e8 6f 99 ff ff       	call   23b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj@plt>
    8a41:	8b 9d fc fe ff ff    	mov    -0x104(%ebp),%ebx
    8a47:	83 c4 10             	add    $0x10,%esp
    8a4a:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
    8a50:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
    8a56:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8a5c:	83 ec 04             	sub    $0x4,%esp
    8a5f:	56                   	push   %esi
    8a60:	57                   	push   %edi
    8a61:	50                   	push   %eax
    8a62:	e8 c9 96 ff ff       	call   2130 <memcpy@plt>
    8a67:	8b b5 fc fe ff ff    	mov    -0x104(%ebp),%esi
    8a6d:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
    8a73:	83 c4 10             	add    $0x10,%esp
    8a76:	e9 92 fc ff ff       	jmp    870d <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x1fd>
    8a7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8a7e:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    8a85:	75 57                	jne    8ade <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x5ce>
    8a87:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8a8d:	83 ec 0c             	sub    $0xc,%esp
    8a90:	8d 93 d5 c3 ff ff    	lea    -0x3c2b(%ebx),%edx
    8a96:	52                   	push   %edx
    8a97:	e8 c4 96 ff ff       	call   2160 <_ZSt24__throw_invalid_argumentPKc@plt>
    8a9c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8a9f:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    8aa6:	75 36                	jne    8ade <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x5ce>
    8aa8:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8aae:	83 ec 0c             	sub    $0xc,%esp
    8ab1:	8d 8b d5 c3 ff ff    	lea    -0x3c2b(%ebx),%ecx
    8ab7:	51                   	push   %ecx
    8ab8:	e8 83 98 ff ff       	call   2340 <_ZSt20__throw_out_of_rangePKc@plt>
    8abd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ac0:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    8ac7:	75 15                	jne    8ade <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc+0x5ce>
    8ac9:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
    8acf:	83 ec 0c             	sub    $0xc,%esp
    8ad2:	8d b3 e0 c5 ff ff    	lea    -0x3a20(%ebx),%esi
    8ad8:	56                   	push   %esi
    8ad9:	e8 d2 96 ff ff       	call   21b0 <_ZSt19__throw_logic_errorPKc@plt>
    8ade:	e8 bd 1e 00 00       	call   a9a0 <__stack_chk_fail_local>
    8ae3:	89 c6                	mov    %eax,%esi
    8ae5:	e9 df 9a ff ff       	jmp    25c9 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold>
    8aea:	89 c6                	mov    %eax,%esi
    8aec:	c5 f8 77             	vzeroupper
    8aef:	e9 9b 9b ff ff       	jmp    268f <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0xc6>
    8af4:	89 c6                	mov    %eax,%esi
    8af6:	e9 cb 9b ff ff       	jmp    26c6 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0xfd>
    8afb:	89 c6                	mov    %eax,%esi
    8afd:	e9 24 9b ff ff       	jmp    2626 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0x5d>
    8b02:	89 c6                	mov    %eax,%esi
    8b04:	e9 cd 9a ff ff       	jmp    25d6 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0xd>
    8b09:	8d bd 00 ff ff ff    	lea    -0x100(%ebp),%edi
    8b0f:	89 c6                	mov    %eax,%esi
    8b11:	89 bd e0 fe ff ff    	mov    %edi,-0x120(%ebp)
    8b17:	c5 f8 77             	vzeroupper
    8b1a:	e9 d1 9a ff ff       	jmp    25f0 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0x27>
    8b1f:	89 c6                	mov    %eax,%esi
    8b21:	c5 f8 77             	vzeroupper
    8b24:	e9 b8 9b ff ff       	jmp    26e1 <_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold+0x118>
    8b29:	66 90                	xchg   %ax,%ax
    8b2b:	66 90                	xchg   %ax,%ax
    8b2d:	66 90                	xchg   %ax,%ax
    8b2f:	90                   	nop

00008b30 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0>:
    8b30:	55                   	push   %ebp
    8b31:	57                   	push   %edi
    8b32:	56                   	push   %esi
    8b33:	89 c5                	mov    %eax,%ebp
    8b35:	53                   	push   %ebx
    8b36:	83 ec 2c             	sub    $0x2c,%esp
    8b39:	e8 f2 ac ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    8b3e:	81 c3 7e 63 00 00    	add    $0x637e,%ebx
    8b44:	85 c0                	test   %eax,%eax
    8b46:	0f 84 7f 01 00 00    	je     8ccb <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x19b>
    8b4c:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b4f:	85 c0                	test   %eax,%eax
    8b51:	0f 84 5a 01 00 00    	je     8cb1 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x181>
    8b57:	8b 48 0c             	mov    0xc(%eax),%ecx
    8b5a:	85 c9                	test   %ecx,%ecx
    8b5c:	0f 84 35 01 00 00    	je     8c97 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x167>
    8b62:	89 ee                	mov    %ebp,%esi
    8b64:	89 44 24 10          	mov    %eax,0x10(%esp)
    8b68:	8b 51 0c             	mov    0xc(%ecx),%edx
    8b6b:	85 d2                	test   %edx,%edx
    8b6d:	0f 84 04 01 00 00    	je     8c77 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x147>
    8b73:	89 f7                	mov    %esi,%edi
    8b75:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    8b79:	8b 72 0c             	mov    0xc(%edx),%esi
    8b7c:	85 f6                	test   %esi,%esi
    8b7e:	0f 84 d3 00 00 00    	je     8c57 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x127>
    8b84:	89 fd                	mov    %edi,%ebp
    8b86:	89 54 24 18          	mov    %edx,0x18(%esp)
    8b8a:	8b 7e 0c             	mov    0xc(%esi),%edi
    8b8d:	85 ff                	test   %edi,%edi
    8b8f:	0f 84 a2 00 00 00    	je     8c37 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x107>
    8b95:	8b 47 0c             	mov    0xc(%edi),%eax
    8b98:	85 c0                	test   %eax,%eax
    8b9a:	74 7c                	je     8c18 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0xe8>
    8b9c:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    8ba0:	89 c5                	mov    %eax,%ebp
    8ba2:	89 74 24 08          	mov    %esi,0x8(%esp)
    8ba6:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ba9:	85 f6                	test   %esi,%esi
    8bab:	74 41                	je     8bee <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0xbe>
    8bad:	89 f1                	mov    %esi,%ecx
    8baf:	8b 76 0c             	mov    0xc(%esi),%esi
    8bb2:	85 f6                	test   %esi,%esi
    8bb4:	74 25                	je     8bdb <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0xab>
    8bb6:	8b 46 0c             	mov    0xc(%esi),%eax
    8bb9:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    8bbd:	e8 6e ff ff ff       	call   8b30 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0>
    8bc2:	89 f2                	mov    %esi,%edx
    8bc4:	8b 76 08             	mov    0x8(%esi),%esi
    8bc7:	83 ec 0c             	sub    $0xc,%esp
    8bca:	52                   	push   %edx
    8bcb:	e8 80 96 ff ff       	call   2250 <_ZdlPv@plt>
    8bd0:	83 c4 10             	add    $0x10,%esp
    8bd3:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    8bd7:	85 f6                	test   %esi,%esi
    8bd9:	75 db                	jne    8bb6 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x86>
    8bdb:	8b 71 08             	mov    0x8(%ecx),%esi
    8bde:	83 ec 0c             	sub    $0xc,%esp
    8be1:	51                   	push   %ecx
    8be2:	e8 69 96 ff ff       	call   2250 <_ZdlPv@plt>
    8be7:	83 c4 10             	add    $0x10,%esp
    8bea:	85 f6                	test   %esi,%esi
    8bec:	75 bf                	jne    8bad <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x7d>
    8bee:	8b 75 08             	mov    0x8(%ebp),%esi
    8bf1:	83 ec 0c             	sub    $0xc,%esp
    8bf4:	55                   	push   %ebp
    8bf5:	e8 56 96 ff ff       	call   2250 <_ZdlPv@plt>
    8bfa:	83 c4 10             	add    $0x10,%esp
    8bfd:	85 f6                	test   %esi,%esi
    8bff:	74 0f                	je     8c10 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0xe0>
    8c01:	89 f5                	mov    %esi,%ebp
    8c03:	eb a1                	jmp    8ba6 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x76>
    8c05:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8c0c:	00 
    8c0d:	8d 76 00             	lea    0x0(%esi),%esi
    8c10:	8b 74 24 08          	mov    0x8(%esp),%esi
    8c14:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    8c18:	8b 47 08             	mov    0x8(%edi),%eax
    8c1b:	83 ec 0c             	sub    $0xc,%esp
    8c1e:	89 44 24 14          	mov    %eax,0x14(%esp)
    8c22:	57                   	push   %edi
    8c23:	e8 28 96 ff ff       	call   2250 <_ZdlPv@plt>
    8c28:	8b 7c 24 18          	mov    0x18(%esp),%edi
    8c2c:	83 c4 10             	add    $0x10,%esp
    8c2f:	85 ff                	test   %edi,%edi
    8c31:	0f 85 5e ff ff ff    	jne    8b95 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x65>
    8c37:	8b 7e 08             	mov    0x8(%esi),%edi
    8c3a:	83 ec 0c             	sub    $0xc,%esp
    8c3d:	56                   	push   %esi
    8c3e:	e8 0d 96 ff ff       	call   2250 <_ZdlPv@plt>
    8c43:	83 c4 10             	add    $0x10,%esp
    8c46:	85 ff                	test   %edi,%edi
    8c48:	74 07                	je     8c51 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x121>
    8c4a:	89 fe                	mov    %edi,%esi
    8c4c:	e9 39 ff ff ff       	jmp    8b8a <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x5a>
    8c51:	8b 54 24 18          	mov    0x18(%esp),%edx
    8c55:	89 ef                	mov    %ebp,%edi
    8c57:	8b 72 08             	mov    0x8(%edx),%esi
    8c5a:	83 ec 0c             	sub    $0xc,%esp
    8c5d:	52                   	push   %edx
    8c5e:	e8 ed 95 ff ff       	call   2250 <_ZdlPv@plt>
    8c63:	83 c4 10             	add    $0x10,%esp
    8c66:	85 f6                	test   %esi,%esi
    8c68:	74 07                	je     8c71 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x141>
    8c6a:	89 f2                	mov    %esi,%edx
    8c6c:	e9 08 ff ff ff       	jmp    8b79 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x49>
    8c71:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    8c75:	89 fe                	mov    %edi,%esi
    8c77:	8b 69 08             	mov    0x8(%ecx),%ebp
    8c7a:	83 ec 0c             	sub    $0xc,%esp
    8c7d:	51                   	push   %ecx
    8c7e:	e8 cd 95 ff ff       	call   2250 <_ZdlPv@plt>
    8c83:	83 c4 10             	add    $0x10,%esp
    8c86:	85 ed                	test   %ebp,%ebp
    8c88:	74 07                	je     8c91 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x161>
    8c8a:	89 e9                	mov    %ebp,%ecx
    8c8c:	e9 d7 fe ff ff       	jmp    8b68 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x38>
    8c91:	8b 44 24 10          	mov    0x10(%esp),%eax
    8c95:	89 f5                	mov    %esi,%ebp
    8c97:	8b 78 08             	mov    0x8(%eax),%edi
    8c9a:	83 ec 0c             	sub    $0xc,%esp
    8c9d:	50                   	push   %eax
    8c9e:	e8 ad 95 ff ff       	call   2250 <_ZdlPv@plt>
    8ca3:	83 c4 10             	add    $0x10,%esp
    8ca6:	85 ff                	test   %edi,%edi
    8ca8:	74 07                	je     8cb1 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x181>
    8caa:	89 f8                	mov    %edi,%eax
    8cac:	e9 a6 fe ff ff       	jmp    8b57 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x27>
    8cb1:	8b 75 08             	mov    0x8(%ebp),%esi
    8cb4:	83 ec 0c             	sub    $0xc,%esp
    8cb7:	55                   	push   %ebp
    8cb8:	e8 93 95 ff ff       	call   2250 <_ZdlPv@plt>
    8cbd:	83 c4 10             	add    $0x10,%esp
    8cc0:	85 f6                	test   %esi,%esi
    8cc2:	74 07                	je     8ccb <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x19b>
    8cc4:	89 f5                	mov    %esi,%ebp
    8cc6:	e9 81 fe ff ff       	jmp    8b4c <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0+0x1c>
    8ccb:	83 c4 2c             	add    $0x2c,%esp
    8cce:	5b                   	pop    %ebx
    8ccf:	5e                   	pop    %esi
    8cd0:	5f                   	pop    %edi
    8cd1:	5d                   	pop    %ebp
    8cd2:	c3                   	ret
    8cd3:	66 90                	xchg   %ax,%ax
    8cd5:	66 90                	xchg   %ax,%ax
    8cd7:	66 90                	xchg   %ax,%ax
    8cd9:	66 90                	xchg   %ax,%ax
    8cdb:	66 90                	xchg   %ax,%ax
    8cdd:	66 90                	xchg   %ax,%ax
    8cdf:	90                   	nop

00008ce0 <_ZNSt3setIjSt4lessIjESaIjEED1Ev>:
    8ce0:	56                   	push   %esi
    8ce1:	53                   	push   %ebx
    8ce2:	83 ec 04             	sub    $0x4,%esp
    8ce5:	8b 44 24 10          	mov    0x10(%esp),%eax
    8ce9:	e8 42 ab ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    8cee:	81 c3 ce 61 00 00    	add    $0x61ce,%ebx
    8cf4:	8b 70 08             	mov    0x8(%eax),%esi
    8cf7:	85 f6                	test   %esi,%esi
    8cf9:	74 1d                	je     8d18 <_ZNSt3setIjSt4lessIjESaIjEED1Ev+0x38>
    8cfb:	8b 46 0c             	mov    0xc(%esi),%eax
    8cfe:	e8 2d fe ff ff       	call   8b30 <_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0>
    8d03:	89 f2                	mov    %esi,%edx
    8d05:	8b 76 08             	mov    0x8(%esi),%esi
    8d08:	83 ec 0c             	sub    $0xc,%esp
    8d0b:	52                   	push   %edx
    8d0c:	e8 3f 95 ff ff       	call   2250 <_ZdlPv@plt>
    8d11:	83 c4 10             	add    $0x10,%esp
    8d14:	85 f6                	test   %esi,%esi
    8d16:	75 e3                	jne    8cfb <_ZNSt3setIjSt4lessIjESaIjEED1Ev+0x1b>
    8d18:	83 c4 04             	add    $0x4,%esp
    8d1b:	5b                   	pop    %ebx
    8d1c:	5e                   	pop    %esi
    8d1d:	c3                   	ret
    8d1e:	66 90                	xchg   %ax,%ax

00008d20 <_Z16saxpy_avx2_ez_iiPfS_fj>:
    8d20:	55                   	push   %ebp
    8d21:	89 e5                	mov    %esp,%ebp
    8d23:	57                   	push   %edi
    8d24:	56                   	push   %esi
    8d25:	53                   	push   %ebx
    8d26:	83 e4 e0             	and    $0xffffffe0,%esp
    8d29:	83 ec 20             	sub    $0x20,%esp
    8d2c:	8b 5d 14             	mov    0x14(%ebp),%ebx
    8d2f:	8b 75 08             	mov    0x8(%ebp),%esi
    8d32:	83 fb 1f             	cmp    $0x1f,%ebx
    8d35:	0f 86 f5 01 00 00    	jbe    8f30 <_Z16saxpy_avx2_ez_iiPfS_fj+0x210>
    8d3b:	89 d9                	mov    %ebx,%ecx
    8d3d:	c4 e2 7d 18 4d 10    	vbroadcastss 0x10(%ebp),%ymm1
    8d43:	8b 45 0c             	mov    0xc(%ebp),%eax
    8d46:	89 f2                	mov    %esi,%edx
    8d48:	83 e1 f8             	and    $0xfffffff8,%ecx
    8d4b:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    8d4f:	8d 79 ff             	lea    -0x1(%ecx),%edi
    8d52:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    8d56:	8d 3c 8e             	lea    (%esi,%ecx,4),%edi
    8d59:	8d 0c 8d e0 ff ff ff 	lea    -0x20(,%ecx,4),%ecx
    8d60:	c1 e9 05             	shr    $0x5,%ecx
    8d63:	41                   	inc    %ecx
    8d64:	83 e1 07             	and    $0x7,%ecx
    8d67:	0f 84 d0 00 00 00    	je     8e3d <_Z16saxpy_avx2_ez_iiPfS_fj+0x11d>
    8d6d:	83 f9 01             	cmp    $0x1,%ecx
    8d70:	0f 84 a7 00 00 00    	je     8e1d <_Z16saxpy_avx2_ez_iiPfS_fj+0xfd>
    8d76:	83 f9 02             	cmp    $0x2,%ecx
    8d79:	0f 84 87 00 00 00    	je     8e06 <_Z16saxpy_avx2_ez_iiPfS_fj+0xe6>
    8d7f:	83 f9 03             	cmp    $0x3,%ecx
    8d82:	74 6b                	je     8def <_Z16saxpy_avx2_ez_iiPfS_fj+0xcf>
    8d84:	83 f9 04             	cmp    $0x4,%ecx
    8d87:	74 4f                	je     8dd8 <_Z16saxpy_avx2_ez_iiPfS_fj+0xb8>
    8d89:	83 f9 05             	cmp    $0x5,%ecx
    8d8c:	74 33                	je     8dc1 <_Z16saxpy_avx2_ez_iiPfS_fj+0xa1>
    8d8e:	83 f9 06             	cmp    $0x6,%ecx
    8d91:	74 17                	je     8daa <_Z16saxpy_avx2_ez_iiPfS_fj+0x8a>
    8d93:	c5 fc 28 16          	vmovaps (%esi),%ymm2
    8d97:	c4 e2 75 a8 10       	vfmadd213ps (%eax),%ymm1,%ymm2
    8d9c:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    8da0:	c5 fc 29 10          	vmovaps %ymm2,(%eax)
    8da4:	8d 56 20             	lea    0x20(%esi),%edx
    8da7:	83 c0 20             	add    $0x20,%eax
    8daa:	c5 fc 28 1a          	vmovaps (%edx),%ymm3
    8dae:	c4 e2 75 a8 18       	vfmadd213ps (%eax),%ymm1,%ymm3
    8db3:	c5 fc 58 c3          	vaddps %ymm3,%ymm0,%ymm0
    8db7:	c5 fc 29 18          	vmovaps %ymm3,(%eax)
    8dbb:	83 c2 20             	add    $0x20,%edx
    8dbe:	83 c0 20             	add    $0x20,%eax
    8dc1:	c5 fc 28 22          	vmovaps (%edx),%ymm4
    8dc5:	c4 e2 75 a8 20       	vfmadd213ps (%eax),%ymm1,%ymm4
    8dca:	c5 fc 58 c4          	vaddps %ymm4,%ymm0,%ymm0
    8dce:	c5 fc 29 20          	vmovaps %ymm4,(%eax)
    8dd2:	83 c2 20             	add    $0x20,%edx
    8dd5:	83 c0 20             	add    $0x20,%eax
    8dd8:	c5 fc 28 2a          	vmovaps (%edx),%ymm5
    8ddc:	c4 e2 75 a8 28       	vfmadd213ps (%eax),%ymm1,%ymm5
    8de1:	c5 fc 58 c5          	vaddps %ymm5,%ymm0,%ymm0
    8de5:	c5 fc 29 28          	vmovaps %ymm5,(%eax)
    8de9:	83 c2 20             	add    $0x20,%edx
    8dec:	83 c0 20             	add    $0x20,%eax
    8def:	c5 fc 28 32          	vmovaps (%edx),%ymm6
    8df3:	c4 e2 75 a8 30       	vfmadd213ps (%eax),%ymm1,%ymm6
    8df8:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    8dfc:	c5 fc 29 30          	vmovaps %ymm6,(%eax)
    8e00:	83 c2 20             	add    $0x20,%edx
    8e03:	83 c0 20             	add    $0x20,%eax
    8e06:	c5 fc 28 3a          	vmovaps (%edx),%ymm7
    8e0a:	c4 e2 75 a8 38       	vfmadd213ps (%eax),%ymm1,%ymm7
    8e0f:	c5 fc 58 c7          	vaddps %ymm7,%ymm0,%ymm0
    8e13:	c5 fc 29 38          	vmovaps %ymm7,(%eax)
    8e17:	83 c2 20             	add    $0x20,%edx
    8e1a:	83 c0 20             	add    $0x20,%eax
    8e1d:	c5 fc 28 12          	vmovaps (%edx),%ymm2
    8e21:	83 c2 20             	add    $0x20,%edx
    8e24:	c4 e2 75 a8 10       	vfmadd213ps (%eax),%ymm1,%ymm2
    8e29:	83 c0 20             	add    $0x20,%eax
    8e2c:	c5 fc 29 50 e0       	vmovaps %ymm2,-0x20(%eax)
    8e31:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    8e35:	39 d7                	cmp    %edx,%edi
    8e37:	0f 84 b9 00 00 00    	je     8ef6 <_Z16saxpy_avx2_ez_iiPfS_fj+0x1d6>
    8e3d:	c5 fc 28 1a          	vmovaps (%edx),%ymm3
    8e41:	c4 e2 75 a8 18       	vfmadd213ps (%eax),%ymm1,%ymm3
    8e46:	c5 fc 58 e3          	vaddps %ymm3,%ymm0,%ymm4
    8e4a:	c5 fc 28 6a 20       	vmovaps 0x20(%edx),%ymm5
    8e4f:	c4 e2 75 a8 68 20    	vfmadd213ps 0x20(%eax),%ymm1,%ymm5
    8e55:	c5 fc 28 7a 40       	vmovaps 0x40(%edx),%ymm7
    8e5a:	c4 e2 75 a8 78 40    	vfmadd213ps 0x40(%eax),%ymm1,%ymm7
    8e60:	c5 fc 28 52 60       	vmovaps 0x60(%edx),%ymm2
    8e65:	c5 fc 29 18          	vmovaps %ymm3,(%eax)
    8e69:	c4 e2 75 a8 50 60    	vfmadd213ps 0x60(%eax),%ymm1,%ymm2
    8e6f:	81 c2 00 01 00 00    	add    $0x100,%edx
    8e75:	05 00 01 00 00       	add    $0x100,%eax
    8e7a:	c5 dc 58 f5          	vaddps %ymm5,%ymm4,%ymm6
    8e7e:	c5 fc 29 a8 20 ff ff 	vmovaps %ymm5,-0xe0(%eax)
    8e85:	ff 
    8e86:	c5 fc 28 62 80       	vmovaps -0x80(%edx),%ymm4
    8e8b:	c4 e2 75 a8 60 80    	vfmadd213ps -0x80(%eax),%ymm1,%ymm4
    8e91:	c5 fc 29 b8 40 ff ff 	vmovaps %ymm7,-0xc0(%eax)
    8e98:	ff 
    8e99:	c5 fc 29 90 60 ff ff 	vmovaps %ymm2,-0xa0(%eax)
    8ea0:	ff 
    8ea1:	c5 cc 58 c7          	vaddps %ymm7,%ymm6,%ymm0
    8ea5:	c5 fc 28 72 a0       	vmovaps -0x60(%edx),%ymm6
    8eaa:	c4 e2 75 a8 70 a0    	vfmadd213ps -0x60(%eax),%ymm1,%ymm6
    8eb0:	c5 fc 29 60 80       	vmovaps %ymm4,-0x80(%eax)
    8eb5:	c5 fc 29 70 a0       	vmovaps %ymm6,-0x60(%eax)
    8eba:	c5 fc 58 da          	vaddps %ymm2,%ymm0,%ymm3
    8ebe:	c5 fc 28 52 c0       	vmovaps -0x40(%edx),%ymm2
    8ec3:	c4 e2 75 a8 50 c0    	vfmadd213ps -0x40(%eax),%ymm1,%ymm2
    8ec9:	c5 fc 29 50 c0       	vmovaps %ymm2,-0x40(%eax)
    8ece:	c5 e4 58 ec          	vaddps %ymm4,%ymm3,%ymm5
    8ed2:	c5 fc 28 5a e0       	vmovaps -0x20(%edx),%ymm3
    8ed7:	c4 e2 75 a8 58 e0    	vfmadd213ps -0x20(%eax),%ymm1,%ymm3
    8edd:	c5 fc 29 58 e0       	vmovaps %ymm3,-0x20(%eax)
    8ee2:	c5 d4 58 fe          	vaddps %ymm6,%ymm5,%ymm7
    8ee6:	c5 c4 58 c2          	vaddps %ymm2,%ymm7,%ymm0
    8eea:	c5 fc 58 c3          	vaddps %ymm3,%ymm0,%ymm0
    8eee:	39 d7                	cmp    %edx,%edi
    8ef0:	0f 85 47 ff ff ff    	jne    8e3d <_Z16saxpy_avx2_ez_iiPfS_fj+0x11d>
    8ef6:	c5 ff 7c c8          	vhaddps %ymm0,%ymm0,%ymm1
    8efa:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    8efe:	c5 f7 7c e1          	vhaddps %ymm1,%ymm1,%ymm4
    8f02:	83 e0 f8             	and    $0xfffffff8,%eax
    8f05:	c4 e3 7d 19 e6 01    	vextractf128 $0x1,%ymm4,%xmm6
    8f0b:	c5 d8 58 fe          	vaddps %xmm6,%xmm4,%xmm7
    8f0f:	83 c0 08             	add    $0x8,%eax
    8f12:	c5 fa 11 7c 24 1c    	vmovss %xmm7,0x1c(%esp)
    8f18:	d9 44 24 1c          	flds   0x1c(%esp)
    8f1c:	c5 f8 77             	vzeroupper
    8f1f:	39 d8                	cmp    %ebx,%eax
    8f21:	72 15                	jb     8f38 <_Z16saxpy_avx2_ez_iiPfS_fj+0x218>
    8f23:	eb 02                	jmp    8f27 <_Z16saxpy_avx2_ez_iiPfS_fj+0x207>
    8f25:	dd d9                	fstp   %st(1)
    8f27:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8f2a:	5b                   	pop    %ebx
    8f2b:	5e                   	pop    %esi
    8f2c:	5f                   	pop    %edi
    8f2d:	5d                   	pop    %ebp
    8f2e:	c3                   	ret
    8f2f:	90                   	nop
    8f30:	31 c0                	xor    %eax,%eax
    8f32:	d9 ee                	fldz
    8f34:	39 d8                	cmp    %ebx,%eax
    8f36:	73 ef                	jae    8f27 <_Z16saxpy_avx2_ez_iiPfS_fj+0x207>
    8f38:	c1 e0 02             	shl    $0x2,%eax
    8f3b:	d9 45 10             	flds   0x10(%ebp)
    8f3e:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    8f41:	8d 34 9e             	lea    (%esi,%ebx,4),%esi
    8f44:	03 45 0c             	add    0xc(%ebp),%eax
    8f47:	89 f3                	mov    %esi,%ebx
    8f49:	29 fb                	sub    %edi,%ebx
    8f4b:	83 eb 04             	sub    $0x4,%ebx
    8f4e:	c1 eb 02             	shr    $0x2,%ebx
    8f51:	43                   	inc    %ebx
    8f52:	83 e3 03             	and    $0x3,%ebx
    8f55:	0f 84 95 00 00 00    	je     8ff0 <_Z16saxpy_avx2_ez_iiPfS_fj+0x2d0>
    8f5b:	83 fb 01             	cmp    $0x1,%ebx
    8f5e:	74 60                	je     8fc0 <_Z16saxpy_avx2_ez_iiPfS_fj+0x2a0>
    8f60:	83 fb 02             	cmp    $0x2,%ebx
    8f63:	74 26                	je     8f8b <_Z16saxpy_avx2_ez_iiPfS_fj+0x26b>
    8f65:	d9 c0                	fld    %st(0)
    8f67:	d8 0f                	fmuls  (%edi)
    8f69:	83 c0 04             	add    $0x4,%eax
    8f6c:	83 c7 04             	add    $0x4,%edi
    8f6f:	d8 40 fc             	fadds  -0x4(%eax)
    8f72:	d9 5c 24 1c          	fstps  0x1c(%esp)
    8f76:	d9 44 24 1c          	flds   0x1c(%esp)
    8f7a:	d9 50 fc             	fsts   -0x4(%eax)
    8f7d:	de c2                	faddp  %st,%st(2)
    8f7f:	d9 c9                	fxch   %st(1)
    8f81:	d9 5c 24 1c          	fstps  0x1c(%esp)
    8f85:	d9 44 24 1c          	flds   0x1c(%esp)
    8f89:	d9 c9                	fxch   %st(1)
    8f8b:	d9 c0                	fld    %st(0)
    8f8d:	d8 0f                	fmuls  (%edi)
    8f8f:	83 c0 04             	add    $0x4,%eax
    8f92:	83 c7 04             	add    $0x4,%edi
    8f95:	d8 40 fc             	fadds  -0x4(%eax)
    8f98:	d9 5c 24 1c          	fstps  0x1c(%esp)
    8f9c:	d9 44 24 1c          	flds   0x1c(%esp)
    8fa0:	d9 50 fc             	fsts   -0x4(%eax)
    8fa3:	de c2                	faddp  %st,%st(2)
    8fa5:	d9 c9                	fxch   %st(1)
    8fa7:	d9 5c 24 1c          	fstps  0x1c(%esp)
    8fab:	d9 44 24 1c          	flds   0x1c(%esp)
    8faf:	eb 11                	jmp    8fc2 <_Z16saxpy_avx2_ez_iiPfS_fj+0x2a2>
    8fb1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8fb8:	00 
    8fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    8fc0:	d9 c9                	fxch   %st(1)
    8fc2:	d9 c1                	fld    %st(1)
    8fc4:	d8 0f                	fmuls  (%edi)
    8fc6:	83 c7 04             	add    $0x4,%edi
    8fc9:	83 c0 04             	add    $0x4,%eax
    8fcc:	d8 40 fc             	fadds  -0x4(%eax)
    8fcf:	d9 5c 24 1c          	fstps  0x1c(%esp)
    8fd3:	d9 44 24 1c          	flds   0x1c(%esp)
    8fd7:	d9 50 fc             	fsts   -0x4(%eax)
    8fda:	de c1                	faddp  %st,%st(1)
    8fdc:	d9 5c 24 1c          	fstps  0x1c(%esp)
    8fe0:	d9 44 24 1c          	flds   0x1c(%esp)
    8fe4:	39 fe                	cmp    %edi,%esi
    8fe6:	0f 84 39 ff ff ff    	je     8f25 <_Z16saxpy_avx2_ez_iiPfS_fj+0x205>
    8fec:	eb 12                	jmp    9000 <_Z16saxpy_avx2_ez_iiPfS_fj+0x2e0>
    8fee:	66 90                	xchg   %ax,%ax
    8ff0:	d9 c9                	fxch   %st(1)
    8ff2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    8ff9:	00 
    8ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    9000:	d9 c1                	fld    %st(1)
    9002:	d8 0f                	fmuls  (%edi)
    9004:	83 c7 10             	add    $0x10,%edi
    9007:	83 c0 10             	add    $0x10,%eax
    900a:	d8 40 f0             	fadds  -0x10(%eax)
    900d:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9011:	d9 44 24 1c          	flds   0x1c(%esp)
    9015:	d9 50 f0             	fsts   -0x10(%eax)
    9018:	de c1                	faddp  %st,%st(1)
    901a:	d9 5c 24 1c          	fstps  0x1c(%esp)
    901e:	d9 44 24 1c          	flds   0x1c(%esp)
    9022:	d9 c1                	fld    %st(1)
    9024:	d8 4f f4             	fmuls  -0xc(%edi)
    9027:	d8 40 f4             	fadds  -0xc(%eax)
    902a:	d9 5c 24 1c          	fstps  0x1c(%esp)
    902e:	d9 44 24 1c          	flds   0x1c(%esp)
    9032:	d9 50 f4             	fsts   -0xc(%eax)
    9035:	de c1                	faddp  %st,%st(1)
    9037:	d9 5c 24 1c          	fstps  0x1c(%esp)
    903b:	d9 44 24 1c          	flds   0x1c(%esp)
    903f:	d9 c1                	fld    %st(1)
    9041:	d8 4f f8             	fmuls  -0x8(%edi)
    9044:	d8 40 f8             	fadds  -0x8(%eax)
    9047:	d9 5c 24 1c          	fstps  0x1c(%esp)
    904b:	d9 44 24 1c          	flds   0x1c(%esp)
    904f:	d9 50 f8             	fsts   -0x8(%eax)
    9052:	de c1                	faddp  %st,%st(1)
    9054:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9058:	d9 44 24 1c          	flds   0x1c(%esp)
    905c:	d9 c1                	fld    %st(1)
    905e:	d8 4f fc             	fmuls  -0x4(%edi)
    9061:	d8 40 fc             	fadds  -0x4(%eax)
    9064:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9068:	d9 44 24 1c          	flds   0x1c(%esp)
    906c:	d9 50 fc             	fsts   -0x4(%eax)
    906f:	de c1                	faddp  %st,%st(1)
    9071:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9075:	d9 44 24 1c          	flds   0x1c(%esp)
    9079:	39 fe                	cmp    %edi,%esi
    907b:	75 83                	jne    9000 <_Z16saxpy_avx2_ez_iiPfS_fj+0x2e0>
    907d:	dd d9                	fstp   %st(1)
    907f:	e9 a3 fe ff ff       	jmp    8f27 <_Z16saxpy_avx2_ez_iiPfS_fj+0x207>
    9084:	66 90                	xchg   %ax,%ax
    9086:	66 90                	xchg   %ax,%ax
    9088:	66 90                	xchg   %ax,%ax
    908a:	66 90                	xchg   %ax,%ax
    908c:	66 90                	xchg   %ax,%ax
    908e:	66 90                	xchg   %ax,%ax

00009090 <_Z20saxpy_avx2_fma_ez_iiPfS_fj>:
    9090:	55                   	push   %ebp
    9091:	89 e5                	mov    %esp,%ebp
    9093:	57                   	push   %edi
    9094:	56                   	push   %esi
    9095:	53                   	push   %ebx
    9096:	83 e4 e0             	and    $0xffffffe0,%esp
    9099:	83 ec 20             	sub    $0x20,%esp
    909c:	8b 5d 14             	mov    0x14(%ebp),%ebx
    909f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    90a2:	8b 45 0c             	mov    0xc(%ebp),%eax
    90a5:	83 fb 1f             	cmp    $0x1f,%ebx
    90a8:	0f 86 72 03 00 00    	jbe    9420 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x390>
    90ae:	89 de                	mov    %ebx,%esi
    90b0:	ba 08 00 00 00       	mov    $0x8,%edx
    90b5:	c4 e2 7d 18 4d 10    	vbroadcastss 0x10(%ebp),%ymm1
    90bb:	c5 fc 28 11          	vmovaps (%ecx),%ymm2
    90bf:	83 e6 f8             	and    $0xfffffff8,%esi
    90c2:	c4 e2 75 a8 10       	vfmadd213ps (%eax),%ymm1,%ymm2
    90c7:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    90cb:	c5 fc 29 10          	vmovaps %ymm2,(%eax)
    90cf:	8d 7e ff             	lea    -0x1(%esi),%edi
    90d2:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    90d6:	c1 ef 03             	shr    $0x3,%edi
    90d9:	83 e7 07             	and    $0x7,%edi
    90dc:	39 f2                	cmp    %esi,%edx
    90de:	0f 83 bd 01 00 00    	jae    92a1 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x211>
    90e4:	85 ff                	test   %edi,%edi
    90e6:	0f 84 d1 00 00 00    	je     91bd <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x12d>
    90ec:	83 ff 01             	cmp    $0x1,%edi
    90ef:	0f 84 a9 00 00 00    	je     919e <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x10e>
    90f5:	83 ff 02             	cmp    $0x2,%edi
    90f8:	0f 84 89 00 00 00    	je     9187 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0xf7>
    90fe:	83 ff 03             	cmp    $0x3,%edi
    9101:	74 6d                	je     9170 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0xe0>
    9103:	83 ff 04             	cmp    $0x4,%edi
    9106:	74 51                	je     9159 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0xc9>
    9108:	83 ff 05             	cmp    $0x5,%edi
    910b:	74 35                	je     9142 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0xb2>
    910d:	83 ff 06             	cmp    $0x6,%edi
    9110:	74 19                	je     912b <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x9b>
    9112:	c5 fc 28 59 20       	vmovaps 0x20(%ecx),%ymm3
    9117:	c4 e2 75 a8 58 20    	vfmadd213ps 0x20(%eax),%ymm1,%ymm3
    911d:	c5 fc 58 c3          	vaddps %ymm3,%ymm0,%ymm0
    9121:	c5 fc 29 58 20       	vmovaps %ymm3,0x20(%eax)
    9126:	ba 10 00 00 00       	mov    $0x10,%edx
    912b:	c5 fc 28 24 91       	vmovaps (%ecx,%edx,4),%ymm4
    9130:	c4 e2 75 a8 24 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm4
    9136:	c5 fc 58 c4          	vaddps %ymm4,%ymm0,%ymm0
    913a:	c5 fc 29 24 90       	vmovaps %ymm4,(%eax,%edx,4)
    913f:	83 c2 08             	add    $0x8,%edx
    9142:	c5 fc 28 2c 91       	vmovaps (%ecx,%edx,4),%ymm5
    9147:	c4 e2 75 a8 2c 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm5
    914d:	c5 fc 58 c5          	vaddps %ymm5,%ymm0,%ymm0
    9151:	c5 fc 29 2c 90       	vmovaps %ymm5,(%eax,%edx,4)
    9156:	83 c2 08             	add    $0x8,%edx
    9159:	c5 fc 28 34 91       	vmovaps (%ecx,%edx,4),%ymm6
    915e:	c4 e2 75 a8 34 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm6
    9164:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    9168:	c5 fc 29 34 90       	vmovaps %ymm6,(%eax,%edx,4)
    916d:	83 c2 08             	add    $0x8,%edx
    9170:	c5 fc 28 3c 91       	vmovaps (%ecx,%edx,4),%ymm7
    9175:	c4 e2 75 a8 3c 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm7
    917b:	c5 fc 58 c7          	vaddps %ymm7,%ymm0,%ymm0
    917f:	c5 fc 29 3c 90       	vmovaps %ymm7,(%eax,%edx,4)
    9184:	83 c2 08             	add    $0x8,%edx
    9187:	c5 fc 28 14 91       	vmovaps (%ecx,%edx,4),%ymm2
    918c:	c4 e2 75 a8 14 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm2
    9192:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    9196:	c5 fc 29 14 90       	vmovaps %ymm2,(%eax,%edx,4)
    919b:	83 c2 08             	add    $0x8,%edx
    919e:	c5 fc 28 1c 91       	vmovaps (%ecx,%edx,4),%ymm3
    91a3:	c4 e2 75 a8 1c 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm3
    91a9:	c5 fc 29 1c 90       	vmovaps %ymm3,(%eax,%edx,4)
    91ae:	83 c2 08             	add    $0x8,%edx
    91b1:	c5 fc 58 c3          	vaddps %ymm3,%ymm0,%ymm0
    91b5:	39 f2                	cmp    %esi,%edx
    91b7:	0f 83 e4 00 00 00    	jae    92a1 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x211>
    91bd:	c5 fc 28 24 91       	vmovaps (%ecx,%edx,4),%ymm4
    91c2:	c4 e2 75 a8 24 90    	vfmadd213ps (%eax,%edx,4),%ymm1,%ymm4
    91c8:	c5 fc 58 ec          	vaddps %ymm4,%ymm0,%ymm5
    91cc:	c5 fc 28 74 91 20    	vmovaps 0x20(%ecx,%edx,4),%ymm6
    91d2:	c4 e2 75 a8 74 90 20 	vfmadd213ps 0x20(%eax,%edx,4),%ymm1,%ymm6
    91d9:	c5 fc 28 54 91 40    	vmovaps 0x40(%ecx,%edx,4),%ymm2
    91df:	c4 e2 75 a8 54 90 40 	vfmadd213ps 0x40(%eax,%edx,4),%ymm1,%ymm2
    91e6:	c5 fc 29 24 90       	vmovaps %ymm4,(%eax,%edx,4)
    91eb:	c5 fc 28 64 91 60    	vmovaps 0x60(%ecx,%edx,4),%ymm4
    91f1:	c4 e2 75 a8 64 90 60 	vfmadd213ps 0x60(%eax,%edx,4),%ymm1,%ymm4
    91f8:	c5 fc 29 74 90 20    	vmovaps %ymm6,0x20(%eax,%edx,4)
    91fe:	c5 d4 58 fe          	vaddps %ymm6,%ymm5,%ymm7
    9202:	c5 fc 28 ac 91 80 00 	vmovaps 0x80(%ecx,%edx,4),%ymm5
    9209:	00 00 
    920b:	c4 e2 75 a8 ac 90 80 	vfmadd213ps 0x80(%eax,%edx,4),%ymm1,%ymm5
    9212:	00 00 00 
    9215:	c5 fc 29 54 90 40    	vmovaps %ymm2,0x40(%eax,%edx,4)
    921b:	c5 fc 29 64 90 60    	vmovaps %ymm4,0x60(%eax,%edx,4)
    9221:	c5 fc 29 ac 90 80 00 	vmovaps %ymm5,0x80(%eax,%edx,4)
    9228:	00 00 
    922a:	c5 c4 58 da          	vaddps %ymm2,%ymm7,%ymm3
    922e:	c5 fc 28 bc 91 a0 00 	vmovaps 0xa0(%ecx,%edx,4),%ymm7
    9235:	00 00 
    9237:	c4 e2 75 a8 bc 90 a0 	vfmadd213ps 0xa0(%eax,%edx,4),%ymm1,%ymm7
    923e:	00 00 00 
    9241:	c5 fc 28 94 91 c0 00 	vmovaps 0xc0(%ecx,%edx,4),%ymm2
    9248:	00 00 
    924a:	c4 e2 75 a8 94 90 c0 	vfmadd213ps 0xc0(%eax,%edx,4),%ymm1,%ymm2
    9251:	00 00 00 
    9254:	c5 fc 29 bc 90 a0 00 	vmovaps %ymm7,0xa0(%eax,%edx,4)
    925b:	00 00 
    925d:	c5 fc 29 94 90 c0 00 	vmovaps %ymm2,0xc0(%eax,%edx,4)
    9264:	00 00 
    9266:	c5 e4 58 c4          	vaddps %ymm4,%ymm3,%ymm0
    926a:	c5 fc 58 f5          	vaddps %ymm5,%ymm0,%ymm6
    926e:	c5 fc 28 ac 91 e0 00 	vmovaps 0xe0(%ecx,%edx,4),%ymm5
    9275:	00 00 
    9277:	c4 e2 75 a8 ac 90 e0 	vfmadd213ps 0xe0(%eax,%edx,4),%ymm1,%ymm5
    927e:	00 00 00 
    9281:	c5 fc 29 ac 90 e0 00 	vmovaps %ymm5,0xe0(%eax,%edx,4)
    9288:	00 00 
    928a:	83 c2 40             	add    $0x40,%edx
    928d:	c5 cc 58 df          	vaddps %ymm7,%ymm6,%ymm3
    9291:	c5 e4 58 e2          	vaddps %ymm2,%ymm3,%ymm4
    9295:	c5 dc 58 c5          	vaddps %ymm5,%ymm4,%ymm0
    9299:	39 f2                	cmp    %esi,%edx
    929b:	0f 82 1c ff ff ff    	jb     91bd <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x12d>
    92a1:	c5 ff 7c c8          	vhaddps %ymm0,%ymm0,%ymm1
    92a5:	89 f2                	mov    %esi,%edx
    92a7:	c5 f7 7c c1          	vhaddps %ymm1,%ymm1,%ymm0
    92ab:	c4 e3 7d 19 c7 01    	vextractf128 $0x1,%ymm0,%xmm7
    92b1:	c5 f8 58 df          	vaddps %xmm7,%xmm0,%xmm3
    92b5:	c5 fa 11 5c 24 1c    	vmovss %xmm3,0x1c(%esp)
    92bb:	d9 44 24 1c          	flds   0x1c(%esp)
    92bf:	c5 f8 77             	vzeroupper
    92c2:	39 da                	cmp    %ebx,%edx
    92c4:	0f 83 49 01 00 00    	jae    9413 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x383>
    92ca:	8d 3c 95 00 00 00 00 	lea    0x0(,%edx,4),%edi
    92d1:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
    92d4:	d9 45 10             	flds   0x10(%ebp)
    92d7:	8d 14 39             	lea    (%ecx,%edi,1),%edx
    92da:	89 d9                	mov    %ebx,%ecx
    92dc:	01 f8                	add    %edi,%eax
    92de:	29 d1                	sub    %edx,%ecx
    92e0:	83 e9 04             	sub    $0x4,%ecx
    92e3:	c1 e9 02             	shr    $0x2,%ecx
    92e6:	41                   	inc    %ecx
    92e7:	83 e1 03             	and    $0x3,%ecx
    92ea:	0f 84 90 00 00 00    	je     9380 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x2f0>
    92f0:	83 f9 01             	cmp    $0x1,%ecx
    92f3:	74 5b                	je     9350 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x2c0>
    92f5:	83 f9 02             	cmp    $0x2,%ecx
    92f8:	74 26                	je     9320 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x290>
    92fa:	d9 c0                	fld    %st(0)
    92fc:	d8 0a                	fmuls  (%edx)
    92fe:	83 c0 04             	add    $0x4,%eax
    9301:	83 c2 04             	add    $0x4,%edx
    9304:	d8 40 fc             	fadds  -0x4(%eax)
    9307:	d9 5c 24 1c          	fstps  0x1c(%esp)
    930b:	d9 44 24 1c          	flds   0x1c(%esp)
    930f:	d9 50 fc             	fsts   -0x4(%eax)
    9312:	de c2                	faddp  %st,%st(2)
    9314:	d9 c9                	fxch   %st(1)
    9316:	d9 5c 24 1c          	fstps  0x1c(%esp)
    931a:	d9 44 24 1c          	flds   0x1c(%esp)
    931e:	d9 c9                	fxch   %st(1)
    9320:	d9 c0                	fld    %st(0)
    9322:	d8 0a                	fmuls  (%edx)
    9324:	83 c0 04             	add    $0x4,%eax
    9327:	83 c2 04             	add    $0x4,%edx
    932a:	d8 40 fc             	fadds  -0x4(%eax)
    932d:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9331:	d9 44 24 1c          	flds   0x1c(%esp)
    9335:	d9 50 fc             	fsts   -0x4(%eax)
    9338:	de c2                	faddp  %st,%st(2)
    933a:	d9 c9                	fxch   %st(1)
    933c:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9340:	d9 44 24 1c          	flds   0x1c(%esp)
    9344:	eb 0c                	jmp    9352 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x2c2>
    9346:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    934d:	00 
    934e:	66 90                	xchg   %ax,%ax
    9350:	d9 c9                	fxch   %st(1)
    9352:	d9 c1                	fld    %st(1)
    9354:	d8 0a                	fmuls  (%edx)
    9356:	83 c2 04             	add    $0x4,%edx
    9359:	83 c0 04             	add    $0x4,%eax
    935c:	d8 40 fc             	fadds  -0x4(%eax)
    935f:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9363:	d9 44 24 1c          	flds   0x1c(%esp)
    9367:	d9 50 fc             	fsts   -0x4(%eax)
    936a:	de c1                	faddp  %st,%st(1)
    936c:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9370:	d9 44 24 1c          	flds   0x1c(%esp)
    9374:	39 d3                	cmp    %edx,%ebx
    9376:	0f 84 95 00 00 00    	je     9411 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x381>
    937c:	eb 12                	jmp    9390 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x300>
    937e:	66 90                	xchg   %ax,%ax
    9380:	d9 c9                	fxch   %st(1)
    9382:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9389:	00 
    938a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    9390:	d9 c1                	fld    %st(1)
    9392:	d8 0a                	fmuls  (%edx)
    9394:	83 c2 10             	add    $0x10,%edx
    9397:	83 c0 10             	add    $0x10,%eax
    939a:	d8 40 f0             	fadds  -0x10(%eax)
    939d:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93a1:	d9 44 24 1c          	flds   0x1c(%esp)
    93a5:	d9 50 f0             	fsts   -0x10(%eax)
    93a8:	de c1                	faddp  %st,%st(1)
    93aa:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93ae:	d9 44 24 1c          	flds   0x1c(%esp)
    93b2:	d9 c1                	fld    %st(1)
    93b4:	d8 4a f4             	fmuls  -0xc(%edx)
    93b7:	d8 40 f4             	fadds  -0xc(%eax)
    93ba:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93be:	d9 44 24 1c          	flds   0x1c(%esp)
    93c2:	d9 50 f4             	fsts   -0xc(%eax)
    93c5:	de c1                	faddp  %st,%st(1)
    93c7:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93cb:	d9 44 24 1c          	flds   0x1c(%esp)
    93cf:	d9 c1                	fld    %st(1)
    93d1:	d8 4a f8             	fmuls  -0x8(%edx)
    93d4:	d8 40 f8             	fadds  -0x8(%eax)
    93d7:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93db:	d9 44 24 1c          	flds   0x1c(%esp)
    93df:	d9 50 f8             	fsts   -0x8(%eax)
    93e2:	de c1                	faddp  %st,%st(1)
    93e4:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93e8:	d9 44 24 1c          	flds   0x1c(%esp)
    93ec:	d9 c1                	fld    %st(1)
    93ee:	d8 4a fc             	fmuls  -0x4(%edx)
    93f1:	d8 40 fc             	fadds  -0x4(%eax)
    93f4:	d9 5c 24 1c          	fstps  0x1c(%esp)
    93f8:	d9 44 24 1c          	flds   0x1c(%esp)
    93fc:	d9 50 fc             	fsts   -0x4(%eax)
    93ff:	de c1                	faddp  %st,%st(1)
    9401:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9405:	d9 44 24 1c          	flds   0x1c(%esp)
    9409:	39 d3                	cmp    %edx,%ebx
    940b:	75 83                	jne    9390 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x300>
    940d:	dd d9                	fstp   %st(1)
    940f:	eb 02                	jmp    9413 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x383>
    9411:	dd d9                	fstp   %st(1)
    9413:	8d 65 f4             	lea    -0xc(%ebp),%esp
    9416:	5b                   	pop    %ebx
    9417:	5e                   	pop    %esi
    9418:	5f                   	pop    %edi
    9419:	5d                   	pop    %ebp
    941a:	c3                   	ret
    941b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    9420:	d9 ee                	fldz
    9422:	31 d2                	xor    %edx,%edx
    9424:	e9 99 fe ff ff       	jmp    92c2 <_Z20saxpy_avx2_fma_ez_iiPfS_fj+0x232>
    9429:	66 90                	xchg   %ax,%ax
    942b:	66 90                	xchg   %ax,%ax
    942d:	66 90                	xchg   %ax,%ax
    942f:	90                   	nop

00009430 <_Z9print256fDv8_f>:
    9430:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    9434:	83 e4 e0             	and    $0xffffffe0,%esp
    9437:	ff 71 fc             	push   -0x4(%ecx)
    943a:	55                   	push   %ebp
    943b:	62 f3 7d 28 03 c8 07 	valignd $0x7,%ymm0,%ymm0,%ymm1
    9442:	62 f3 7d 28 03 d0 06 	valignd $0x6,%ymm0,%ymm0,%ymm2
    9449:	62 f3 7d 28 03 d8 05 	valignd $0x5,%ymm0,%ymm0,%ymm3
    9450:	62 f3 7d 28 19 c4 01 	vextractf32x4 $0x1,%ymm0,%xmm4
    9457:	89 e5                	mov    %esp,%ebp
    9459:	53                   	push   %ebx
    945a:	51                   	push   %ecx
    945b:	83 ec 78             	sub    $0x78,%esp
    945e:	c5 fa 11 4d e4       	vmovss %xmm1,-0x1c(%ebp)
    9463:	d9 45 e4             	flds   -0x1c(%ebp)
    9466:	dd 5c 24 38          	fstpl  0x38(%esp)
    946a:	c5 fa 11 55 e4       	vmovss %xmm2,-0x1c(%ebp)
    946f:	d9 45 e4             	flds   -0x1c(%ebp)
    9472:	dd 5c 24 30          	fstpl  0x30(%esp)
    9476:	c5 fa 11 5d e4       	vmovss %xmm3,-0x1c(%ebp)
    947b:	d9 45 e4             	flds   -0x1c(%ebp)
    947e:	dd 5c 24 28          	fstpl  0x28(%esp)
    9482:	c5 fa 11 65 e4       	vmovss %xmm4,-0x1c(%ebp)
    9487:	d9 45 e4             	flds   -0x1c(%ebp)
    948a:	e8 a1 a3 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    948f:	81 c3 2d 5a 00 00    	add    $0x5a2d,%ebx
    9495:	dd 5c 24 20          	fstpl  0x20(%esp)
    9499:	c4 e3 79 17 45 e4 03 	vextractps $0x3,%xmm0,-0x1c(%ebp)
    94a0:	d9 45 e4             	flds   -0x1c(%ebp)
    94a3:	dd 5c 24 18          	fstpl  0x18(%esp)
    94a7:	c4 e3 79 17 45 e4 02 	vextractps $0x2,%xmm0,-0x1c(%ebp)
    94ae:	d9 45 e4             	flds   -0x1c(%ebp)
    94b1:	dd 5c 24 10          	fstpl  0x10(%esp)
    94b5:	c4 e3 79 17 45 e4 01 	vextractps $0x1,%xmm0,-0x1c(%ebp)
    94bc:	d9 45 e4             	flds   -0x1c(%ebp)
    94bf:	dd 5c 24 08          	fstpl  0x8(%esp)
    94c3:	c5 fa 11 45 e4       	vmovss %xmm0,-0x1c(%ebp)
    94c8:	d9 45 e4             	flds   -0x1c(%ebp)
    94cb:	8d 83 a4 ca ff ff    	lea    -0x355c(%ebx),%eax
    94d1:	dd 1c 24             	fstpl  (%esp)
    94d4:	50                   	push   %eax
    94d5:	6a 02                	push   $0x2
    94d7:	c5 f8 77             	vzeroupper
    94da:	e8 51 8b ff ff       	call   2030 <__printf_chk@plt>
    94df:	83 c4 50             	add    $0x50,%esp
    94e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    94e5:	59                   	pop    %ecx
    94e6:	5b                   	pop    %ebx
    94e7:	5d                   	pop    %ebp
    94e8:	8d 61 fc             	lea    -0x4(%ecx),%esp
    94eb:	c3                   	ret
    94ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000094f0 <_Z21saxpy_avx2_intrinsicsPfS_fj>:
    94f0:	55                   	push   %ebp
    94f1:	89 e5                	mov    %esp,%ebp
    94f3:	57                   	push   %edi
    94f4:	56                   	push   %esi
    94f5:	53                   	push   %ebx
    94f6:	83 e4 e0             	and    $0xffffffe0,%esp
    94f9:	83 ec 20             	sub    $0x20,%esp
    94fc:	8b 5d 14             	mov    0x14(%ebp),%ebx
    94ff:	8b 75 08             	mov    0x8(%ebp),%esi
    9502:	83 fb 1f             	cmp    $0x1f,%ebx
    9505:	0f 86 f5 01 00 00    	jbe    9700 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x210>
    950b:	89 d9                	mov    %ebx,%ecx
    950d:	c4 e2 7d 18 4d 10    	vbroadcastss 0x10(%ebp),%ymm1
    9513:	8b 45 0c             	mov    0xc(%ebp),%eax
    9516:	89 f2                	mov    %esi,%edx
    9518:	83 e1 f8             	and    $0xfffffff8,%ecx
    951b:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    951f:	8d 79 ff             	lea    -0x1(%ecx),%edi
    9522:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    9526:	8d 3c 8e             	lea    (%esi,%ecx,4),%edi
    9529:	8d 0c 8d e0 ff ff ff 	lea    -0x20(,%ecx,4),%ecx
    9530:	c1 e9 05             	shr    $0x5,%ecx
    9533:	41                   	inc    %ecx
    9534:	83 e1 07             	and    $0x7,%ecx
    9537:	0f 84 d0 00 00 00    	je     960d <_Z21saxpy_avx2_intrinsicsPfS_fj+0x11d>
    953d:	83 f9 01             	cmp    $0x1,%ecx
    9540:	0f 84 a7 00 00 00    	je     95ed <_Z21saxpy_avx2_intrinsicsPfS_fj+0xfd>
    9546:	83 f9 02             	cmp    $0x2,%ecx
    9549:	0f 84 87 00 00 00    	je     95d6 <_Z21saxpy_avx2_intrinsicsPfS_fj+0xe6>
    954f:	83 f9 03             	cmp    $0x3,%ecx
    9552:	74 6b                	je     95bf <_Z21saxpy_avx2_intrinsicsPfS_fj+0xcf>
    9554:	83 f9 04             	cmp    $0x4,%ecx
    9557:	74 4f                	je     95a8 <_Z21saxpy_avx2_intrinsicsPfS_fj+0xb8>
    9559:	83 f9 05             	cmp    $0x5,%ecx
    955c:	74 33                	je     9591 <_Z21saxpy_avx2_intrinsicsPfS_fj+0xa1>
    955e:	83 f9 06             	cmp    $0x6,%ecx
    9561:	74 17                	je     957a <_Z21saxpy_avx2_intrinsicsPfS_fj+0x8a>
    9563:	c5 fc 28 16          	vmovaps (%esi),%ymm2
    9567:	c4 e2 75 a8 10       	vfmadd213ps (%eax),%ymm1,%ymm2
    956c:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    9570:	c5 fc 29 10          	vmovaps %ymm2,(%eax)
    9574:	8d 56 20             	lea    0x20(%esi),%edx
    9577:	83 c0 20             	add    $0x20,%eax
    957a:	c5 fc 28 1a          	vmovaps (%edx),%ymm3
    957e:	c4 e2 75 a8 18       	vfmadd213ps (%eax),%ymm1,%ymm3
    9583:	c5 fc 58 c3          	vaddps %ymm3,%ymm0,%ymm0
    9587:	c5 fc 29 18          	vmovaps %ymm3,(%eax)
    958b:	83 c2 20             	add    $0x20,%edx
    958e:	83 c0 20             	add    $0x20,%eax
    9591:	c5 fc 28 22          	vmovaps (%edx),%ymm4
    9595:	c4 e2 75 a8 20       	vfmadd213ps (%eax),%ymm1,%ymm4
    959a:	c5 fc 58 c4          	vaddps %ymm4,%ymm0,%ymm0
    959e:	c5 fc 29 20          	vmovaps %ymm4,(%eax)
    95a2:	83 c2 20             	add    $0x20,%edx
    95a5:	83 c0 20             	add    $0x20,%eax
    95a8:	c5 fc 28 2a          	vmovaps (%edx),%ymm5
    95ac:	c4 e2 75 a8 28       	vfmadd213ps (%eax),%ymm1,%ymm5
    95b1:	c5 fc 58 c5          	vaddps %ymm5,%ymm0,%ymm0
    95b5:	c5 fc 29 28          	vmovaps %ymm5,(%eax)
    95b9:	83 c2 20             	add    $0x20,%edx
    95bc:	83 c0 20             	add    $0x20,%eax
    95bf:	c5 fc 28 32          	vmovaps (%edx),%ymm6
    95c3:	c4 e2 75 a8 30       	vfmadd213ps (%eax),%ymm1,%ymm6
    95c8:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    95cc:	c5 fc 29 30          	vmovaps %ymm6,(%eax)
    95d0:	83 c2 20             	add    $0x20,%edx
    95d3:	83 c0 20             	add    $0x20,%eax
    95d6:	c5 fc 28 3a          	vmovaps (%edx),%ymm7
    95da:	c4 e2 75 a8 38       	vfmadd213ps (%eax),%ymm1,%ymm7
    95df:	c5 fc 58 c7          	vaddps %ymm7,%ymm0,%ymm0
    95e3:	c5 fc 29 38          	vmovaps %ymm7,(%eax)
    95e7:	83 c2 20             	add    $0x20,%edx
    95ea:	83 c0 20             	add    $0x20,%eax
    95ed:	c5 fc 28 12          	vmovaps (%edx),%ymm2
    95f1:	83 c2 20             	add    $0x20,%edx
    95f4:	c4 e2 75 a8 10       	vfmadd213ps (%eax),%ymm1,%ymm2
    95f9:	83 c0 20             	add    $0x20,%eax
    95fc:	c5 fc 29 50 e0       	vmovaps %ymm2,-0x20(%eax)
    9601:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    9605:	39 d7                	cmp    %edx,%edi
    9607:	0f 84 b9 00 00 00    	je     96c6 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x1d6>
    960d:	c5 fc 28 1a          	vmovaps (%edx),%ymm3
    9611:	c4 e2 75 a8 18       	vfmadd213ps (%eax),%ymm1,%ymm3
    9616:	c5 fc 58 e3          	vaddps %ymm3,%ymm0,%ymm4
    961a:	c5 fc 28 6a 20       	vmovaps 0x20(%edx),%ymm5
    961f:	c4 e2 75 a8 68 20    	vfmadd213ps 0x20(%eax),%ymm1,%ymm5
    9625:	c5 fc 28 7a 40       	vmovaps 0x40(%edx),%ymm7
    962a:	c4 e2 75 a8 78 40    	vfmadd213ps 0x40(%eax),%ymm1,%ymm7
    9630:	c5 fc 28 52 60       	vmovaps 0x60(%edx),%ymm2
    9635:	c5 fc 29 18          	vmovaps %ymm3,(%eax)
    9639:	c4 e2 75 a8 50 60    	vfmadd213ps 0x60(%eax),%ymm1,%ymm2
    963f:	81 c2 00 01 00 00    	add    $0x100,%edx
    9645:	05 00 01 00 00       	add    $0x100,%eax
    964a:	c5 dc 58 f5          	vaddps %ymm5,%ymm4,%ymm6
    964e:	c5 fc 29 a8 20 ff ff 	vmovaps %ymm5,-0xe0(%eax)
    9655:	ff 
    9656:	c5 fc 28 62 80       	vmovaps -0x80(%edx),%ymm4
    965b:	c4 e2 75 a8 60 80    	vfmadd213ps -0x80(%eax),%ymm1,%ymm4
    9661:	c5 fc 29 b8 40 ff ff 	vmovaps %ymm7,-0xc0(%eax)
    9668:	ff 
    9669:	c5 fc 29 90 60 ff ff 	vmovaps %ymm2,-0xa0(%eax)
    9670:	ff 
    9671:	c5 cc 58 c7          	vaddps %ymm7,%ymm6,%ymm0
    9675:	c5 fc 28 72 a0       	vmovaps -0x60(%edx),%ymm6
    967a:	c4 e2 75 a8 70 a0    	vfmadd213ps -0x60(%eax),%ymm1,%ymm6
    9680:	c5 fc 29 60 80       	vmovaps %ymm4,-0x80(%eax)
    9685:	c5 fc 29 70 a0       	vmovaps %ymm6,-0x60(%eax)
    968a:	c5 fc 58 da          	vaddps %ymm2,%ymm0,%ymm3
    968e:	c5 fc 28 52 c0       	vmovaps -0x40(%edx),%ymm2
    9693:	c4 e2 75 a8 50 c0    	vfmadd213ps -0x40(%eax),%ymm1,%ymm2
    9699:	c5 fc 29 50 c0       	vmovaps %ymm2,-0x40(%eax)
    969e:	c5 e4 58 ec          	vaddps %ymm4,%ymm3,%ymm5
    96a2:	c5 fc 28 5a e0       	vmovaps -0x20(%edx),%ymm3
    96a7:	c4 e2 75 a8 58 e0    	vfmadd213ps -0x20(%eax),%ymm1,%ymm3
    96ad:	c5 fc 29 58 e0       	vmovaps %ymm3,-0x20(%eax)
    96b2:	c5 d4 58 fe          	vaddps %ymm6,%ymm5,%ymm7
    96b6:	c5 c4 58 c2          	vaddps %ymm2,%ymm7,%ymm0
    96ba:	c5 fc 58 c3          	vaddps %ymm3,%ymm0,%ymm0
    96be:	39 d7                	cmp    %edx,%edi
    96c0:	0f 85 47 ff ff ff    	jne    960d <_Z21saxpy_avx2_intrinsicsPfS_fj+0x11d>
    96c6:	c5 ff 7c c8          	vhaddps %ymm0,%ymm0,%ymm1
    96ca:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    96ce:	c5 f7 7c e1          	vhaddps %ymm1,%ymm1,%ymm4
    96d2:	83 e0 f8             	and    $0xfffffff8,%eax
    96d5:	c4 e3 7d 19 e6 01    	vextractf128 $0x1,%ymm4,%xmm6
    96db:	c5 d8 58 fe          	vaddps %xmm6,%xmm4,%xmm7
    96df:	83 c0 08             	add    $0x8,%eax
    96e2:	c5 fa 11 7c 24 1c    	vmovss %xmm7,0x1c(%esp)
    96e8:	d9 44 24 1c          	flds   0x1c(%esp)
    96ec:	c5 f8 77             	vzeroupper
    96ef:	39 d8                	cmp    %ebx,%eax
    96f1:	72 15                	jb     9708 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x218>
    96f3:	eb 02                	jmp    96f7 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x207>
    96f5:	dd d9                	fstp   %st(1)
    96f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    96fa:	5b                   	pop    %ebx
    96fb:	5e                   	pop    %esi
    96fc:	5f                   	pop    %edi
    96fd:	5d                   	pop    %ebp
    96fe:	c3                   	ret
    96ff:	90                   	nop
    9700:	31 c0                	xor    %eax,%eax
    9702:	d9 ee                	fldz
    9704:	39 d8                	cmp    %ebx,%eax
    9706:	73 ef                	jae    96f7 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x207>
    9708:	c1 e0 02             	shl    $0x2,%eax
    970b:	d9 45 10             	flds   0x10(%ebp)
    970e:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    9711:	8d 34 9e             	lea    (%esi,%ebx,4),%esi
    9714:	03 45 0c             	add    0xc(%ebp),%eax
    9717:	89 f3                	mov    %esi,%ebx
    9719:	29 fb                	sub    %edi,%ebx
    971b:	83 eb 04             	sub    $0x4,%ebx
    971e:	c1 eb 02             	shr    $0x2,%ebx
    9721:	43                   	inc    %ebx
    9722:	83 e3 03             	and    $0x3,%ebx
    9725:	0f 84 95 00 00 00    	je     97c0 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x2d0>
    972b:	83 fb 01             	cmp    $0x1,%ebx
    972e:	74 60                	je     9790 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x2a0>
    9730:	83 fb 02             	cmp    $0x2,%ebx
    9733:	74 26                	je     975b <_Z21saxpy_avx2_intrinsicsPfS_fj+0x26b>
    9735:	d9 c0                	fld    %st(0)
    9737:	d8 0f                	fmuls  (%edi)
    9739:	83 c0 04             	add    $0x4,%eax
    973c:	83 c7 04             	add    $0x4,%edi
    973f:	d8 40 fc             	fadds  -0x4(%eax)
    9742:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9746:	d9 44 24 1c          	flds   0x1c(%esp)
    974a:	d9 50 fc             	fsts   -0x4(%eax)
    974d:	de c2                	faddp  %st,%st(2)
    974f:	d9 c9                	fxch   %st(1)
    9751:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9755:	d9 44 24 1c          	flds   0x1c(%esp)
    9759:	d9 c9                	fxch   %st(1)
    975b:	d9 c0                	fld    %st(0)
    975d:	d8 0f                	fmuls  (%edi)
    975f:	83 c0 04             	add    $0x4,%eax
    9762:	83 c7 04             	add    $0x4,%edi
    9765:	d8 40 fc             	fadds  -0x4(%eax)
    9768:	d9 5c 24 1c          	fstps  0x1c(%esp)
    976c:	d9 44 24 1c          	flds   0x1c(%esp)
    9770:	d9 50 fc             	fsts   -0x4(%eax)
    9773:	de c2                	faddp  %st,%st(2)
    9775:	d9 c9                	fxch   %st(1)
    9777:	d9 5c 24 1c          	fstps  0x1c(%esp)
    977b:	d9 44 24 1c          	flds   0x1c(%esp)
    977f:	eb 11                	jmp    9792 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x2a2>
    9781:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9788:	00 
    9789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    9790:	d9 c9                	fxch   %st(1)
    9792:	d9 c1                	fld    %st(1)
    9794:	d8 0f                	fmuls  (%edi)
    9796:	83 c7 04             	add    $0x4,%edi
    9799:	83 c0 04             	add    $0x4,%eax
    979c:	d8 40 fc             	fadds  -0x4(%eax)
    979f:	d9 5c 24 1c          	fstps  0x1c(%esp)
    97a3:	d9 44 24 1c          	flds   0x1c(%esp)
    97a7:	d9 50 fc             	fsts   -0x4(%eax)
    97aa:	de c1                	faddp  %st,%st(1)
    97ac:	d9 5c 24 1c          	fstps  0x1c(%esp)
    97b0:	d9 44 24 1c          	flds   0x1c(%esp)
    97b4:	39 fe                	cmp    %edi,%esi
    97b6:	0f 84 39 ff ff ff    	je     96f5 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x205>
    97bc:	eb 12                	jmp    97d0 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x2e0>
    97be:	66 90                	xchg   %ax,%ax
    97c0:	d9 c9                	fxch   %st(1)
    97c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    97c9:	00 
    97ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    97d0:	d9 c1                	fld    %st(1)
    97d2:	d8 0f                	fmuls  (%edi)
    97d4:	83 c7 10             	add    $0x10,%edi
    97d7:	83 c0 10             	add    $0x10,%eax
    97da:	d8 40 f0             	fadds  -0x10(%eax)
    97dd:	d9 5c 24 1c          	fstps  0x1c(%esp)
    97e1:	d9 44 24 1c          	flds   0x1c(%esp)
    97e5:	d9 50 f0             	fsts   -0x10(%eax)
    97e8:	de c1                	faddp  %st,%st(1)
    97ea:	d9 5c 24 1c          	fstps  0x1c(%esp)
    97ee:	d9 44 24 1c          	flds   0x1c(%esp)
    97f2:	d9 c1                	fld    %st(1)
    97f4:	d8 4f f4             	fmuls  -0xc(%edi)
    97f7:	d8 40 f4             	fadds  -0xc(%eax)
    97fa:	d9 5c 24 1c          	fstps  0x1c(%esp)
    97fe:	d9 44 24 1c          	flds   0x1c(%esp)
    9802:	d9 50 f4             	fsts   -0xc(%eax)
    9805:	de c1                	faddp  %st,%st(1)
    9807:	d9 5c 24 1c          	fstps  0x1c(%esp)
    980b:	d9 44 24 1c          	flds   0x1c(%esp)
    980f:	d9 c1                	fld    %st(1)
    9811:	d8 4f f8             	fmuls  -0x8(%edi)
    9814:	d8 40 f8             	fadds  -0x8(%eax)
    9817:	d9 5c 24 1c          	fstps  0x1c(%esp)
    981b:	d9 44 24 1c          	flds   0x1c(%esp)
    981f:	d9 50 f8             	fsts   -0x8(%eax)
    9822:	de c1                	faddp  %st,%st(1)
    9824:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9828:	d9 44 24 1c          	flds   0x1c(%esp)
    982c:	d9 c1                	fld    %st(1)
    982e:	d8 4f fc             	fmuls  -0x4(%edi)
    9831:	d8 40 fc             	fadds  -0x4(%eax)
    9834:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9838:	d9 44 24 1c          	flds   0x1c(%esp)
    983c:	d9 50 fc             	fsts   -0x4(%eax)
    983f:	de c1                	faddp  %st,%st(1)
    9841:	d9 5c 24 1c          	fstps  0x1c(%esp)
    9845:	d9 44 24 1c          	flds   0x1c(%esp)
    9849:	39 fe                	cmp    %edi,%esi
    984b:	75 83                	jne    97d0 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x2e0>
    984d:	dd d9                	fstp   %st(1)
    984f:	e9 a3 fe ff ff       	jmp    96f7 <_Z21saxpy_avx2_intrinsicsPfS_fj+0x207>
    9854:	66 90                	xchg   %ax,%ax
    9856:	66 90                	xchg   %ax,%ax
    9858:	66 90                	xchg   %ax,%ax
    985a:	66 90                	xchg   %ax,%ax
    985c:	66 90                	xchg   %ax,%ax
    985e:	66 90                	xchg   %ax,%ax

00009860 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj>:
    9860:	55                   	push   %ebp
    9861:	89 e5                	mov    %esp,%ebp
    9863:	57                   	push   %edi
    9864:	56                   	push   %esi
    9865:	53                   	push   %ebx
    9866:	83 e4 c0             	and    $0xffffffc0,%esp
    9869:	83 ec 40             	sub    $0x40,%esp
    986c:	8b 5d 14             	mov    0x14(%ebp),%ebx
    986f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9872:	8b 45 0c             	mov    0xc(%ebp),%eax
    9875:	83 fb 0f             	cmp    $0xf,%ebx
    9878:	0f 86 e2 03 00 00    	jbe    9c60 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x400>
    987e:	89 de                	mov    %ebx,%esi
    9880:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    9884:	ba 10 00 00 00       	mov    $0x10,%edx
    9889:	62 f2 7d 48 18 4d 04 	vbroadcastss 0x10(%ebp),%zmm1
    9890:	83 e6 f0             	and    $0xfffffff0,%esi
    9893:	62 f1 7c 48 28 11    	vmovaps (%ecx),%zmm2
    9899:	62 f2 75 48 a8 10    	vfmadd213ps (%eax),%zmm1,%zmm2
    989f:	62 f1 7c 48 58 c2    	vaddps %zmm2,%zmm0,%zmm0
    98a5:	8d 7e ff             	lea    -0x1(%esi),%edi
    98a8:	c1 ef 04             	shr    $0x4,%edi
    98ab:	62 f1 7c 48 29 10    	vmovaps %zmm2,(%eax)
    98b1:	83 e7 07             	and    $0x7,%edi
    98b4:	39 f2                	cmp    %esi,%edx
    98b6:	0f 83 06 02 00 00    	jae    9ac2 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x262>
    98bc:	85 ff                	test   %edi,%edi
    98be:	0f 84 06 01 00 00    	je     99ca <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x16a>
    98c4:	83 ff 01             	cmp    $0x1,%edi
    98c7:	0f 84 d7 00 00 00    	je     99a4 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x144>
    98cd:	83 ff 02             	cmp    $0x2,%edi
    98d0:	0f 84 b0 00 00 00    	je     9986 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x126>
    98d6:	83 ff 03             	cmp    $0x3,%edi
    98d9:	0f 84 89 00 00 00    	je     9968 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x108>
    98df:	83 ff 04             	cmp    $0x4,%edi
    98e2:	74 66                	je     994a <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0xea>
    98e4:	83 ff 05             	cmp    $0x5,%edi
    98e7:	74 43                	je     992c <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0xcc>
    98e9:	83 ff 06             	cmp    $0x6,%edi
    98ec:	74 20                	je     990e <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0xae>
    98ee:	62 f1 7c 48 28 59 01 	vmovaps 0x40(%ecx),%zmm3
    98f5:	62 f2 75 48 a8 58 01 	vfmadd213ps 0x40(%eax),%zmm1,%zmm3
    98fc:	62 f1 7c 48 58 c3    	vaddps %zmm3,%zmm0,%zmm0
    9902:	62 f1 7c 48 29 58 01 	vmovaps %zmm3,0x40(%eax)
    9909:	ba 20 00 00 00       	mov    $0x20,%edx
    990e:	62 f1 7c 48 28 24 91 	vmovaps (%ecx,%edx,4),%zmm4
    9915:	62 f2 75 48 a8 24 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm4
    991c:	62 f1 7c 48 58 c4    	vaddps %zmm4,%zmm0,%zmm0
    9922:	62 f1 7c 48 29 24 90 	vmovaps %zmm4,(%eax,%edx,4)
    9929:	83 c2 10             	add    $0x10,%edx
    992c:	62 f1 7c 48 28 2c 91 	vmovaps (%ecx,%edx,4),%zmm5
    9933:	62 f2 75 48 a8 2c 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm5
    993a:	62 f1 7c 48 58 c5    	vaddps %zmm5,%zmm0,%zmm0
    9940:	62 f1 7c 48 29 2c 90 	vmovaps %zmm5,(%eax,%edx,4)
    9947:	83 c2 10             	add    $0x10,%edx
    994a:	62 f1 7c 48 28 34 91 	vmovaps (%ecx,%edx,4),%zmm6
    9951:	62 f2 75 48 a8 34 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm6
    9958:	62 f1 7c 48 58 c6    	vaddps %zmm6,%zmm0,%zmm0
    995e:	62 f1 7c 48 29 34 90 	vmovaps %zmm6,(%eax,%edx,4)
    9965:	83 c2 10             	add    $0x10,%edx
    9968:	62 f1 7c 48 28 3c 91 	vmovaps (%ecx,%edx,4),%zmm7
    996f:	62 f2 75 48 a8 3c 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm7
    9976:	62 f1 7c 48 58 c7    	vaddps %zmm7,%zmm0,%zmm0
    997c:	62 f1 7c 48 29 3c 90 	vmovaps %zmm7,(%eax,%edx,4)
    9983:	83 c2 10             	add    $0x10,%edx
    9986:	62 f1 7c 48 28 14 91 	vmovaps (%ecx,%edx,4),%zmm2
    998d:	62 f2 75 48 a8 14 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm2
    9994:	62 f1 7c 48 58 c2    	vaddps %zmm2,%zmm0,%zmm0
    999a:	62 f1 7c 48 29 14 90 	vmovaps %zmm2,(%eax,%edx,4)
    99a1:	83 c2 10             	add    $0x10,%edx
    99a4:	62 f1 7c 48 28 1c 91 	vmovaps (%ecx,%edx,4),%zmm3
    99ab:	62 f2 75 48 a8 1c 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm3
    99b2:	62 f1 7c 48 29 1c 90 	vmovaps %zmm3,(%eax,%edx,4)
    99b9:	83 c2 10             	add    $0x10,%edx
    99bc:	62 f1 7c 48 58 c3    	vaddps %zmm3,%zmm0,%zmm0
    99c2:	39 f2                	cmp    %esi,%edx
    99c4:	0f 83 f8 00 00 00    	jae    9ac2 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x262>
    99ca:	62 f1 7c 48 28 24 91 	vmovaps (%ecx,%edx,4),%zmm4
    99d1:	62 f2 75 48 a8 24 90 	vfmadd213ps (%eax,%edx,4),%zmm1,%zmm4
    99d8:	62 f1 7c 48 58 ec    	vaddps %zmm4,%zmm0,%zmm5
    99de:	62 f1 7c 48 28 74 91 	vmovaps 0x40(%ecx,%edx,4),%zmm6
    99e5:	01 
    99e6:	62 f2 75 48 a8 74 90 	vfmadd213ps 0x40(%eax,%edx,4),%zmm1,%zmm6
    99ed:	01 
    99ee:	62 f1 7c 48 28 54 91 	vmovaps 0x80(%ecx,%edx,4),%zmm2
    99f5:	02 
    99f6:	62 f2 75 48 a8 54 90 	vfmadd213ps 0x80(%eax,%edx,4),%zmm1,%zmm2
    99fd:	02 
    99fe:	62 f1 7c 48 29 24 90 	vmovaps %zmm4,(%eax,%edx,4)
    9a05:	62 f1 7c 48 28 64 91 	vmovaps 0xc0(%ecx,%edx,4),%zmm4
    9a0c:	03 
    9a0d:	62 f2 75 48 a8 64 90 	vfmadd213ps 0xc0(%eax,%edx,4),%zmm1,%zmm4
    9a14:	03 
    9a15:	62 f1 7c 48 29 74 90 	vmovaps %zmm6,0x40(%eax,%edx,4)
    9a1c:	01 
    9a1d:	62 f1 54 48 58 fe    	vaddps %zmm6,%zmm5,%zmm7
    9a23:	62 f1 7c 48 28 6c 91 	vmovaps 0x100(%ecx,%edx,4),%zmm5
    9a2a:	04 
    9a2b:	62 f2 75 48 a8 6c 90 	vfmadd213ps 0x100(%eax,%edx,4),%zmm1,%zmm5
    9a32:	04 
    9a33:	62 f1 7c 48 29 54 90 	vmovaps %zmm2,0x80(%eax,%edx,4)
    9a3a:	02 
    9a3b:	62 f1 7c 48 29 64 90 	vmovaps %zmm4,0xc0(%eax,%edx,4)
    9a42:	03 
    9a43:	62 f1 7c 48 29 6c 90 	vmovaps %zmm5,0x100(%eax,%edx,4)
    9a4a:	04 
    9a4b:	62 f1 44 48 58 da    	vaddps %zmm2,%zmm7,%zmm3
    9a51:	62 f1 7c 48 28 7c 91 	vmovaps 0x140(%ecx,%edx,4),%zmm7
    9a58:	05 
    9a59:	62 f2 75 48 a8 7c 90 	vfmadd213ps 0x140(%eax,%edx,4),%zmm1,%zmm7
    9a60:	05 
    9a61:	62 f1 7c 48 28 54 91 	vmovaps 0x180(%ecx,%edx,4),%zmm2
    9a68:	06 
    9a69:	62 f2 75 48 a8 54 90 	vfmadd213ps 0x180(%eax,%edx,4),%zmm1,%zmm2
    9a70:	06 
    9a71:	62 f1 7c 48 29 7c 90 	vmovaps %zmm7,0x140(%eax,%edx,4)
    9a78:	05 
    9a79:	62 f1 7c 48 29 54 90 	vmovaps %zmm2,0x180(%eax,%edx,4)
    9a80:	06 
    9a81:	62 f1 64 48 58 c4    	vaddps %zmm4,%zmm3,%zmm0
    9a87:	62 f1 7c 48 58 f5    	vaddps %zmm5,%zmm0,%zmm6
    9a8d:	62 f1 7c 48 28 6c 91 	vmovaps 0x1c0(%ecx,%edx,4),%zmm5
    9a94:	07 
    9a95:	62 f2 75 48 a8 6c 90 	vfmadd213ps 0x1c0(%eax,%edx,4),%zmm1,%zmm5
    9a9c:	07 
    9a9d:	62 f1 7c 48 29 6c 90 	vmovaps %zmm5,0x1c0(%eax,%edx,4)
    9aa4:	07 
    9aa5:	83 ea 80             	sub    $0xffffff80,%edx
    9aa8:	62 f1 4c 48 58 df    	vaddps %zmm7,%zmm6,%zmm3
    9aae:	62 f1 64 48 58 e2    	vaddps %zmm2,%zmm3,%zmm4
    9ab4:	62 f1 5c 48 58 c5    	vaddps %zmm5,%zmm4,%zmm0
    9aba:	39 f2                	cmp    %esi,%edx
    9abc:	0f 82 08 ff ff ff    	jb     99ca <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x16a>
    9ac2:	c5 fc 28 c8          	vmovaps %ymm0,%ymm1
    9ac6:	62 f3 7d 48 1b c0 01 	vextractf32x8 $0x1,%zmm0,%ymm0
    9acd:	89 f2                	mov    %esi,%edx
    9acf:	c5 ff 7c d8          	vhaddps %ymm0,%ymm0,%ymm3
    9ad3:	c5 f7 7c f1          	vhaddps %ymm1,%ymm1,%ymm6
    9ad7:	c5 e7 7c e3          	vhaddps %ymm3,%ymm3,%ymm4
    9adb:	c5 cf 7c fe          	vhaddps %ymm6,%ymm6,%ymm7
    9adf:	c4 e3 7d 19 e0 01    	vextractf128 $0x1,%ymm4,%xmm0
    9ae5:	c4 e3 7d 19 fd 01    	vextractf128 $0x1,%ymm7,%xmm5
    9aeb:	c5 c0 58 cd          	vaddps %xmm5,%xmm7,%xmm1
    9aef:	c5 d8 58 f8          	vaddps %xmm0,%xmm4,%xmm7
    9af3:	c5 f0 58 df          	vaddps %xmm7,%xmm1,%xmm3
    9af7:	c5 fa 11 5c 24 3c    	vmovss %xmm3,0x3c(%esp)
    9afd:	d9 44 24 3c          	flds   0x3c(%esp)
    9b01:	c5 f8 77             	vzeroupper
    9b04:	39 da                	cmp    %ebx,%edx
    9b06:	0f 83 47 01 00 00    	jae    9c53 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x3f3>
    9b0c:	8d 3c 95 00 00 00 00 	lea    0x0(,%edx,4),%edi
    9b13:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
    9b16:	d9 45 10             	flds   0x10(%ebp)
    9b19:	8d 14 39             	lea    (%ecx,%edi,1),%edx
    9b1c:	89 d9                	mov    %ebx,%ecx
    9b1e:	01 f8                	add    %edi,%eax
    9b20:	29 d1                	sub    %edx,%ecx
    9b22:	83 e9 04             	sub    $0x4,%ecx
    9b25:	c1 e9 02             	shr    $0x2,%ecx
    9b28:	41                   	inc    %ecx
    9b29:	83 e1 03             	and    $0x3,%ecx
    9b2c:	0f 84 8e 00 00 00    	je     9bc0 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x360>
    9b32:	83 f9 01             	cmp    $0x1,%ecx
    9b35:	74 59                	je     9b90 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x330>
    9b37:	83 f9 02             	cmp    $0x2,%ecx
    9b3a:	74 26                	je     9b62 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x302>
    9b3c:	d9 c0                	fld    %st(0)
    9b3e:	d8 0a                	fmuls  (%edx)
    9b40:	83 c0 04             	add    $0x4,%eax
    9b43:	83 c2 04             	add    $0x4,%edx
    9b46:	d8 40 fc             	fadds  -0x4(%eax)
    9b49:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9b4d:	d9 44 24 3c          	flds   0x3c(%esp)
    9b51:	d9 50 fc             	fsts   -0x4(%eax)
    9b54:	de c2                	faddp  %st,%st(2)
    9b56:	d9 c9                	fxch   %st(1)
    9b58:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9b5c:	d9 44 24 3c          	flds   0x3c(%esp)
    9b60:	d9 c9                	fxch   %st(1)
    9b62:	d9 c0                	fld    %st(0)
    9b64:	d8 0a                	fmuls  (%edx)
    9b66:	83 c0 04             	add    $0x4,%eax
    9b69:	83 c2 04             	add    $0x4,%edx
    9b6c:	d8 40 fc             	fadds  -0x4(%eax)
    9b6f:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9b73:	d9 44 24 3c          	flds   0x3c(%esp)
    9b77:	d9 50 fc             	fsts   -0x4(%eax)
    9b7a:	de c2                	faddp  %st,%st(2)
    9b7c:	d9 c9                	fxch   %st(1)
    9b7e:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9b82:	d9 44 24 3c          	flds   0x3c(%esp)
    9b86:	eb 0a                	jmp    9b92 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x332>
    9b88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9b8f:	00 
    9b90:	d9 c9                	fxch   %st(1)
    9b92:	d9 c1                	fld    %st(1)
    9b94:	d8 0a                	fmuls  (%edx)
    9b96:	83 c2 04             	add    $0x4,%edx
    9b99:	83 c0 04             	add    $0x4,%eax
    9b9c:	d8 40 fc             	fadds  -0x4(%eax)
    9b9f:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9ba3:	d9 44 24 3c          	flds   0x3c(%esp)
    9ba7:	d9 50 fc             	fsts   -0x4(%eax)
    9baa:	de c1                	faddp  %st,%st(1)
    9bac:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9bb0:	d9 44 24 3c          	flds   0x3c(%esp)
    9bb4:	39 d3                	cmp    %edx,%ebx
    9bb6:	0f 84 95 00 00 00    	je     9c51 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x3f1>
    9bbc:	eb 12                	jmp    9bd0 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x370>
    9bbe:	66 90                	xchg   %ax,%ax
    9bc0:	d9 c9                	fxch   %st(1)
    9bc2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9bc9:	00 
    9bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    9bd0:	d9 c1                	fld    %st(1)
    9bd2:	d8 0a                	fmuls  (%edx)
    9bd4:	83 c2 10             	add    $0x10,%edx
    9bd7:	83 c0 10             	add    $0x10,%eax
    9bda:	d8 40 f0             	fadds  -0x10(%eax)
    9bdd:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9be1:	d9 44 24 3c          	flds   0x3c(%esp)
    9be5:	d9 50 f0             	fsts   -0x10(%eax)
    9be8:	de c1                	faddp  %st,%st(1)
    9bea:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9bee:	d9 44 24 3c          	flds   0x3c(%esp)
    9bf2:	d9 c1                	fld    %st(1)
    9bf4:	d8 4a f4             	fmuls  -0xc(%edx)
    9bf7:	d8 40 f4             	fadds  -0xc(%eax)
    9bfa:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9bfe:	d9 44 24 3c          	flds   0x3c(%esp)
    9c02:	d9 50 f4             	fsts   -0xc(%eax)
    9c05:	de c1                	faddp  %st,%st(1)
    9c07:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9c0b:	d9 44 24 3c          	flds   0x3c(%esp)
    9c0f:	d9 c1                	fld    %st(1)
    9c11:	d8 4a f8             	fmuls  -0x8(%edx)
    9c14:	d8 40 f8             	fadds  -0x8(%eax)
    9c17:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9c1b:	d9 44 24 3c          	flds   0x3c(%esp)
    9c1f:	d9 50 f8             	fsts   -0x8(%eax)
    9c22:	de c1                	faddp  %st,%st(1)
    9c24:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9c28:	d9 44 24 3c          	flds   0x3c(%esp)
    9c2c:	d9 c1                	fld    %st(1)
    9c2e:	d8 4a fc             	fmuls  -0x4(%edx)
    9c31:	d8 40 fc             	fadds  -0x4(%eax)
    9c34:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9c38:	d9 44 24 3c          	flds   0x3c(%esp)
    9c3c:	d9 50 fc             	fsts   -0x4(%eax)
    9c3f:	de c1                	faddp  %st,%st(1)
    9c41:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9c45:	d9 44 24 3c          	flds   0x3c(%esp)
    9c49:	39 d3                	cmp    %edx,%ebx
    9c4b:	75 83                	jne    9bd0 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x370>
    9c4d:	dd d9                	fstp   %st(1)
    9c4f:	eb 02                	jmp    9c53 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x3f3>
    9c51:	dd d9                	fstp   %st(1)
    9c53:	8d 65 f4             	lea    -0xc(%ebp),%esp
    9c56:	5b                   	pop    %ebx
    9c57:	5e                   	pop    %esi
    9c58:	5f                   	pop    %edi
    9c59:	5d                   	pop    %ebp
    9c5a:	c3                   	ret
    9c5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    9c60:	d9 ee                	fldz
    9c62:	31 d2                	xor    %edx,%edx
    9c64:	e9 9b fe ff ff       	jmp    9b04 <_Z27saxpy_avx512_fma_intrinsicsPfS_fj+0x2a4>
    9c69:	66 90                	xchg   %ax,%ax
    9c6b:	66 90                	xchg   %ax,%ax
    9c6d:	66 90                	xchg   %ax,%ax
    9c6f:	90                   	nop

00009c70 <_Z23saxpy_avx512_intrinsicsPfS_fj>:
    9c70:	55                   	push   %ebp
    9c71:	89 e5                	mov    %esp,%ebp
    9c73:	57                   	push   %edi
    9c74:	56                   	push   %esi
    9c75:	53                   	push   %ebx
    9c76:	83 e4 c0             	and    $0xffffffc0,%esp
    9c79:	83 ec 40             	sub    $0x40,%esp
    9c7c:	8b 5d 14             	mov    0x14(%ebp),%ebx
    9c7f:	8b 75 08             	mov    0x8(%ebp),%esi
    9c82:	83 fb 0f             	cmp    $0xf,%ebx
    9c85:	0f 86 85 02 00 00    	jbe    9f10 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x2a0>
    9c8b:	89 d9                	mov    %ebx,%ecx
    9c8d:	62 f2 7d 48 18 4d 04 	vbroadcastss 0x10(%ebp),%zmm1
    9c94:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c97:	89 f2                	mov    %esi,%edx
    9c99:	83 e1 f0             	and    $0xfffffff0,%ecx
    9c9c:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    9ca0:	8d 79 ff             	lea    -0x1(%ecx),%edi
    9ca3:	89 7c 24 3c          	mov    %edi,0x3c(%esp)
    9ca7:	8d 3c 8e             	lea    (%esi,%ecx,4),%edi
    9caa:	8d 0c 8d c0 ff ff ff 	lea    -0x40(,%ecx,4),%ecx
    9cb1:	c1 e9 06             	shr    $0x6,%ecx
    9cb4:	41                   	inc    %ecx
    9cb5:	83 e1 07             	and    $0x7,%ecx
    9cb8:	0f 84 05 01 00 00    	je     9dc3 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x153>
    9cbe:	83 f9 01             	cmp    $0x1,%ecx
    9cc1:	0f 84 d5 00 00 00    	je     9d9c <_Z23saxpy_avx512_intrinsicsPfS_fj+0x12c>
    9cc7:	83 f9 02             	cmp    $0x2,%ecx
    9cca:	0f 84 ae 00 00 00    	je     9d7e <_Z23saxpy_avx512_intrinsicsPfS_fj+0x10e>
    9cd0:	83 f9 03             	cmp    $0x3,%ecx
    9cd3:	0f 84 87 00 00 00    	je     9d60 <_Z23saxpy_avx512_intrinsicsPfS_fj+0xf0>
    9cd9:	83 f9 04             	cmp    $0x4,%ecx
    9cdc:	74 64                	je     9d42 <_Z23saxpy_avx512_intrinsicsPfS_fj+0xd2>
    9cde:	83 f9 05             	cmp    $0x5,%ecx
    9ce1:	74 41                	je     9d24 <_Z23saxpy_avx512_intrinsicsPfS_fj+0xb4>
    9ce3:	83 f9 06             	cmp    $0x6,%ecx
    9ce6:	74 1e                	je     9d06 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x96>
    9ce8:	62 f1 7c 48 28 16    	vmovaps (%esi),%zmm2
    9cee:	62 f2 75 48 a8 10    	vfmadd213ps (%eax),%zmm1,%zmm2
    9cf4:	62 f1 7c 48 58 c2    	vaddps %zmm2,%zmm0,%zmm0
    9cfa:	62 f1 7c 48 29 10    	vmovaps %zmm2,(%eax)
    9d00:	8d 56 40             	lea    0x40(%esi),%edx
    9d03:	83 c0 40             	add    $0x40,%eax
    9d06:	62 f1 7c 48 28 1a    	vmovaps (%edx),%zmm3
    9d0c:	62 f2 75 48 a8 18    	vfmadd213ps (%eax),%zmm1,%zmm3
    9d12:	62 f1 7c 48 58 c3    	vaddps %zmm3,%zmm0,%zmm0
    9d18:	62 f1 7c 48 29 18    	vmovaps %zmm3,(%eax)
    9d1e:	83 c2 40             	add    $0x40,%edx
    9d21:	83 c0 40             	add    $0x40,%eax
    9d24:	62 f1 7c 48 28 22    	vmovaps (%edx),%zmm4
    9d2a:	62 f2 75 48 a8 20    	vfmadd213ps (%eax),%zmm1,%zmm4
    9d30:	62 f1 7c 48 58 c4    	vaddps %zmm4,%zmm0,%zmm0
    9d36:	62 f1 7c 48 29 20    	vmovaps %zmm4,(%eax)
    9d3c:	83 c2 40             	add    $0x40,%edx
    9d3f:	83 c0 40             	add    $0x40,%eax
    9d42:	62 f1 7c 48 28 2a    	vmovaps (%edx),%zmm5
    9d48:	62 f2 75 48 a8 28    	vfmadd213ps (%eax),%zmm1,%zmm5
    9d4e:	62 f1 7c 48 58 c5    	vaddps %zmm5,%zmm0,%zmm0
    9d54:	62 f1 7c 48 29 28    	vmovaps %zmm5,(%eax)
    9d5a:	83 c2 40             	add    $0x40,%edx
    9d5d:	83 c0 40             	add    $0x40,%eax
    9d60:	62 f1 7c 48 28 32    	vmovaps (%edx),%zmm6
    9d66:	62 f2 75 48 a8 30    	vfmadd213ps (%eax),%zmm1,%zmm6
    9d6c:	62 f1 7c 48 58 c6    	vaddps %zmm6,%zmm0,%zmm0
    9d72:	62 f1 7c 48 29 30    	vmovaps %zmm6,(%eax)
    9d78:	83 c2 40             	add    $0x40,%edx
    9d7b:	83 c0 40             	add    $0x40,%eax
    9d7e:	62 f1 7c 48 28 3a    	vmovaps (%edx),%zmm7
    9d84:	62 f2 75 48 a8 38    	vfmadd213ps (%eax),%zmm1,%zmm7
    9d8a:	62 f1 7c 48 58 c7    	vaddps %zmm7,%zmm0,%zmm0
    9d90:	62 f1 7c 48 29 38    	vmovaps %zmm7,(%eax)
    9d96:	83 c2 40             	add    $0x40,%edx
    9d99:	83 c0 40             	add    $0x40,%eax
    9d9c:	62 f1 7c 48 28 12    	vmovaps (%edx),%zmm2
    9da2:	83 c2 40             	add    $0x40,%edx
    9da5:	62 f2 75 48 a8 10    	vfmadd213ps (%eax),%zmm1,%zmm2
    9dab:	83 c0 40             	add    $0x40,%eax
    9dae:	62 f1 7c 48 29 50 ff 	vmovaps %zmm2,-0x40(%eax)
    9db5:	62 f1 7c 48 58 c2    	vaddps %zmm2,%zmm0,%zmm0
    9dbb:	39 d7                	cmp    %edx,%edi
    9dbd:	0f 84 e8 00 00 00    	je     9eab <_Z23saxpy_avx512_intrinsicsPfS_fj+0x23b>
    9dc3:	62 f1 7c 48 28 1a    	vmovaps (%edx),%zmm3
    9dc9:	62 f2 75 48 a8 18    	vfmadd213ps (%eax),%zmm1,%zmm3
    9dcf:	62 f1 7c 48 58 e3    	vaddps %zmm3,%zmm0,%zmm4
    9dd5:	62 f1 7c 48 28 6a 01 	vmovaps 0x40(%edx),%zmm5
    9ddc:	62 f2 75 48 a8 68 01 	vfmadd213ps 0x40(%eax),%zmm1,%zmm5
    9de3:	62 f1 7c 48 28 7a 02 	vmovaps 0x80(%edx),%zmm7
    9dea:	62 f2 75 48 a8 78 02 	vfmadd213ps 0x80(%eax),%zmm1,%zmm7
    9df1:	62 f1 7c 48 28 52 03 	vmovaps 0xc0(%edx),%zmm2
    9df8:	62 f1 7c 48 29 18    	vmovaps %zmm3,(%eax)
    9dfe:	62 f2 75 48 a8 50 03 	vfmadd213ps 0xc0(%eax),%zmm1,%zmm2
    9e05:	81 c2 00 02 00 00    	add    $0x200,%edx
    9e0b:	05 00 02 00 00       	add    $0x200,%eax
    9e10:	62 f1 5c 48 58 f5    	vaddps %zmm5,%zmm4,%zmm6
    9e16:	62 f1 7c 48 29 68 f9 	vmovaps %zmm5,-0x1c0(%eax)
    9e1d:	62 f1 7c 48 28 62 fc 	vmovaps -0x100(%edx),%zmm4
    9e24:	62 f2 75 48 a8 60 fc 	vfmadd213ps -0x100(%eax),%zmm1,%zmm4
    9e2b:	62 f1 7c 48 29 78 fa 	vmovaps %zmm7,-0x180(%eax)
    9e32:	62 f1 7c 48 29 50 fb 	vmovaps %zmm2,-0x140(%eax)
    9e39:	62 f1 4c 48 58 c7    	vaddps %zmm7,%zmm6,%zmm0
    9e3f:	62 f1 7c 48 28 72 fd 	vmovaps -0xc0(%edx),%zmm6
    9e46:	62 f2 75 48 a8 70 fd 	vfmadd213ps -0xc0(%eax),%zmm1,%zmm6
    9e4d:	62 f1 7c 48 29 60 fc 	vmovaps %zmm4,-0x100(%eax)
    9e54:	62 f1 7c 48 29 70 fd 	vmovaps %zmm6,-0xc0(%eax)
    9e5b:	62 f1 7c 48 58 da    	vaddps %zmm2,%zmm0,%zmm3
    9e61:	62 f1 7c 48 28 52 fe 	vmovaps -0x80(%edx),%zmm2
    9e68:	62 f2 75 48 a8 50 fe 	vfmadd213ps -0x80(%eax),%zmm1,%zmm2
    9e6f:	62 f1 7c 48 29 50 fe 	vmovaps %zmm2,-0x80(%eax)
    9e76:	62 f1 64 48 58 ec    	vaddps %zmm4,%zmm3,%zmm5
    9e7c:	62 f1 7c 48 28 5a ff 	vmovaps -0x40(%edx),%zmm3
    9e83:	62 f2 75 48 a8 58 ff 	vfmadd213ps -0x40(%eax),%zmm1,%zmm3
    9e8a:	62 f1 7c 48 29 58 ff 	vmovaps %zmm3,-0x40(%eax)
    9e91:	62 f1 54 48 58 fe    	vaddps %zmm6,%zmm5,%zmm7
    9e97:	62 f1 44 48 58 c2    	vaddps %zmm2,%zmm7,%zmm0
    9e9d:	62 f1 7c 48 58 c3    	vaddps %zmm3,%zmm0,%zmm0
    9ea3:	39 d7                	cmp    %edx,%edi
    9ea5:	0f 85 18 ff ff ff    	jne    9dc3 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x153>
    9eab:	62 f3 7d 48 1b c4 01 	vextractf32x8 $0x1,%zmm0,%ymm4
    9eb2:	c5 ff 7c e8          	vhaddps %ymm0,%ymm0,%ymm5
    9eb6:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    9eba:	c5 df 7c fc          	vhaddps %ymm4,%ymm4,%ymm7
    9ebe:	c5 d7 7c f5          	vhaddps %ymm5,%ymm5,%ymm6
    9ec2:	c5 c7 7c c7          	vhaddps %ymm7,%ymm7,%ymm0
    9ec6:	83 e0 f0             	and    $0xfffffff0,%eax
    9ec9:	c4 e3 7d 19 f1 01    	vextractf128 $0x1,%ymm6,%xmm1
    9ecf:	c5 c8 58 e9          	vaddps %xmm1,%xmm6,%xmm5
    9ed3:	83 c0 10             	add    $0x10,%eax
    9ed6:	c4 e3 7d 19 c4 01    	vextractf128 $0x1,%ymm0,%xmm4
    9edc:	c5 f8 58 f4          	vaddps %xmm4,%xmm0,%xmm6
    9ee0:	c5 d0 58 fe          	vaddps %xmm6,%xmm5,%xmm7
    9ee4:	c5 fa 11 7c 24 3c    	vmovss %xmm7,0x3c(%esp)
    9eea:	d9 44 24 3c          	flds   0x3c(%esp)
    9eee:	c5 f8 77             	vzeroupper
    9ef1:	39 d8                	cmp    %ebx,%eax
    9ef3:	72 23                	jb     9f18 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x2a8>
    9ef5:	eb 02                	jmp    9ef9 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x289>
    9ef7:	dd d9                	fstp   %st(1)
    9ef9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    9efc:	5b                   	pop    %ebx
    9efd:	5e                   	pop    %esi
    9efe:	5f                   	pop    %edi
    9eff:	5d                   	pop    %ebp
    9f00:	c3                   	ret
    9f01:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9f08:	00 
    9f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    9f10:	31 c0                	xor    %eax,%eax
    9f12:	d9 ee                	fldz
    9f14:	39 d8                	cmp    %ebx,%eax
    9f16:	73 e1                	jae    9ef9 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x289>
    9f18:	c1 e0 02             	shl    $0x2,%eax
    9f1b:	d9 45 10             	flds   0x10(%ebp)
    9f1e:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    9f21:	8d 34 9e             	lea    (%esi,%ebx,4),%esi
    9f24:	03 45 0c             	add    0xc(%ebp),%eax
    9f27:	89 f3                	mov    %esi,%ebx
    9f29:	29 fb                	sub    %edi,%ebx
    9f2b:	83 eb 04             	sub    $0x4,%ebx
    9f2e:	c1 eb 02             	shr    $0x2,%ebx
    9f31:	43                   	inc    %ebx
    9f32:	83 e3 03             	and    $0x3,%ebx
    9f35:	0f 84 95 00 00 00    	je     9fd0 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x360>
    9f3b:	83 fb 01             	cmp    $0x1,%ebx
    9f3e:	74 60                	je     9fa0 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x330>
    9f40:	83 fb 02             	cmp    $0x2,%ebx
    9f43:	74 26                	je     9f6b <_Z23saxpy_avx512_intrinsicsPfS_fj+0x2fb>
    9f45:	d9 c0                	fld    %st(0)
    9f47:	d8 0f                	fmuls  (%edi)
    9f49:	83 c0 04             	add    $0x4,%eax
    9f4c:	83 c7 04             	add    $0x4,%edi
    9f4f:	d8 40 fc             	fadds  -0x4(%eax)
    9f52:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9f56:	d9 44 24 3c          	flds   0x3c(%esp)
    9f5a:	d9 50 fc             	fsts   -0x4(%eax)
    9f5d:	de c2                	faddp  %st,%st(2)
    9f5f:	d9 c9                	fxch   %st(1)
    9f61:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9f65:	d9 44 24 3c          	flds   0x3c(%esp)
    9f69:	d9 c9                	fxch   %st(1)
    9f6b:	d9 c0                	fld    %st(0)
    9f6d:	d8 0f                	fmuls  (%edi)
    9f6f:	83 c0 04             	add    $0x4,%eax
    9f72:	83 c7 04             	add    $0x4,%edi
    9f75:	d8 40 fc             	fadds  -0x4(%eax)
    9f78:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9f7c:	d9 44 24 3c          	flds   0x3c(%esp)
    9f80:	d9 50 fc             	fsts   -0x4(%eax)
    9f83:	de c2                	faddp  %st,%st(2)
    9f85:	d9 c9                	fxch   %st(1)
    9f87:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9f8b:	d9 44 24 3c          	flds   0x3c(%esp)
    9f8f:	eb 11                	jmp    9fa2 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x332>
    9f91:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9f98:	00 
    9f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    9fa0:	d9 c9                	fxch   %st(1)
    9fa2:	d9 c1                	fld    %st(1)
    9fa4:	d8 0f                	fmuls  (%edi)
    9fa6:	83 c7 04             	add    $0x4,%edi
    9fa9:	83 c0 04             	add    $0x4,%eax
    9fac:	d8 40 fc             	fadds  -0x4(%eax)
    9faf:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9fb3:	d9 44 24 3c          	flds   0x3c(%esp)
    9fb7:	d9 50 fc             	fsts   -0x4(%eax)
    9fba:	de c1                	faddp  %st,%st(1)
    9fbc:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9fc0:	d9 44 24 3c          	flds   0x3c(%esp)
    9fc4:	39 fe                	cmp    %edi,%esi
    9fc6:	0f 84 2b ff ff ff    	je     9ef7 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x287>
    9fcc:	eb 12                	jmp    9fe0 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x370>
    9fce:	66 90                	xchg   %ax,%ax
    9fd0:	d9 c9                	fxch   %st(1)
    9fd2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    9fd9:	00 
    9fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    9fe0:	d9 c1                	fld    %st(1)
    9fe2:	d8 0f                	fmuls  (%edi)
    9fe4:	83 c7 10             	add    $0x10,%edi
    9fe7:	83 c0 10             	add    $0x10,%eax
    9fea:	d8 40 f0             	fadds  -0x10(%eax)
    9fed:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9ff1:	d9 44 24 3c          	flds   0x3c(%esp)
    9ff5:	d9 50 f0             	fsts   -0x10(%eax)
    9ff8:	de c1                	faddp  %st,%st(1)
    9ffa:	d9 5c 24 3c          	fstps  0x3c(%esp)
    9ffe:	d9 44 24 3c          	flds   0x3c(%esp)
    a002:	d9 c1                	fld    %st(1)
    a004:	d8 4f f4             	fmuls  -0xc(%edi)
    a007:	d8 40 f4             	fadds  -0xc(%eax)
    a00a:	d9 5c 24 3c          	fstps  0x3c(%esp)
    a00e:	d9 44 24 3c          	flds   0x3c(%esp)
    a012:	d9 50 f4             	fsts   -0xc(%eax)
    a015:	de c1                	faddp  %st,%st(1)
    a017:	d9 5c 24 3c          	fstps  0x3c(%esp)
    a01b:	d9 44 24 3c          	flds   0x3c(%esp)
    a01f:	d9 c1                	fld    %st(1)
    a021:	d8 4f f8             	fmuls  -0x8(%edi)
    a024:	d8 40 f8             	fadds  -0x8(%eax)
    a027:	d9 5c 24 3c          	fstps  0x3c(%esp)
    a02b:	d9 44 24 3c          	flds   0x3c(%esp)
    a02f:	d9 50 f8             	fsts   -0x8(%eax)
    a032:	de c1                	faddp  %st,%st(1)
    a034:	d9 5c 24 3c          	fstps  0x3c(%esp)
    a038:	d9 44 24 3c          	flds   0x3c(%esp)
    a03c:	d9 c1                	fld    %st(1)
    a03e:	d8 4f fc             	fmuls  -0x4(%edi)
    a041:	d8 40 fc             	fadds  -0x4(%eax)
    a044:	d9 5c 24 3c          	fstps  0x3c(%esp)
    a048:	d9 44 24 3c          	flds   0x3c(%esp)
    a04c:	d9 50 fc             	fsts   -0x4(%eax)
    a04f:	de c1                	faddp  %st,%st(1)
    a051:	d9 5c 24 3c          	fstps  0x3c(%esp)
    a055:	d9 44 24 3c          	flds   0x3c(%esp)
    a059:	39 fe                	cmp    %edi,%esi
    a05b:	75 83                	jne    9fe0 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x370>
    a05d:	dd d9                	fstp   %st(1)
    a05f:	e9 95 fe ff ff       	jmp    9ef9 <_Z23saxpy_avx512_intrinsicsPfS_fj+0x289>
    a064:	66 90                	xchg   %ax,%ax
    a066:	66 90                	xchg   %ax,%ax
    a068:	66 90                	xchg   %ax,%ax
    a06a:	66 90                	xchg   %ax,%ax
    a06c:	66 90                	xchg   %ax,%ax
    a06e:	66 90                	xchg   %ax,%ax

0000a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>:
    a070:	57                   	push   %edi
    a071:	89 c7                	mov    %eax,%edi
    a073:	56                   	push   %esi
    a074:	53                   	push   %ebx
    a075:	e8 b6 97 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    a07a:	81 c3 42 4e 00 00    	add    $0x4e42,%ebx
    a080:	85 d2                	test   %edx,%edx
    a082:	74 1d                	je     a0a1 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0+0x31>
    a084:	83 ec 0c             	sub    $0xc,%esp
    a087:	89 d6                	mov    %edx,%esi
    a089:	52                   	push   %edx
    a08a:	e8 c1 80 ff ff       	call   2150 <strlen@plt>
    a08f:	83 c4 0c             	add    $0xc,%esp
    a092:	50                   	push   %eax
    a093:	56                   	push   %esi
    a094:	57                   	push   %edi
    a095:	e8 46 82 ff ff       	call   22e0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i@plt>
    a09a:	83 c4 10             	add    $0x10,%esp
    a09d:	5b                   	pop    %ebx
    a09e:	5e                   	pop    %esi
    a09f:	5f                   	pop    %edi
    a0a0:	c3                   	ret
    a0a1:	8b 00                	mov    (%eax),%eax
    a0a3:	03 78 f4             	add    -0xc(%eax),%edi
    a0a6:	50                   	push   %eax
    a0a7:	50                   	push   %eax
    a0a8:	8b 57 14             	mov    0x14(%edi),%edx
    a0ab:	83 ca 01             	or     $0x1,%edx
    a0ae:	52                   	push   %edx
    a0af:	57                   	push   %edi
    a0b0:	e8 db 82 ff ff       	call   2390 <_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@plt>
    a0b5:	83 c4 10             	add    $0x10,%esp
    a0b8:	eb e3                	jmp    a09d <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0+0x2d>
    a0ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0000a0c0 <_Z20posix_signal_handleriP9siginfo_tPv>:
    a0c0:	53                   	push   %ebx
    a0c1:	83 ec 08             	sub    $0x8,%esp
    a0c4:	8b 44 24 10          	mov    0x10(%esp),%eax
    a0c8:	e8 63 97 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    a0cd:	81 c3 ef 4d 00 00    	add    $0x4def,%ebx
    a0d3:	83 f8 0f             	cmp    $0xf,%eax
    a0d6:	77 28                	ja     a100 <.L9>
    a0d8:	8b 84 83 94 cf ff ff 	mov    -0x306c(%ebx,%eax,4),%eax
    a0df:	01 d8                	add    %ebx,%eax
    a0e1:	ff e0                	jmp    *%eax

0000a0e3 <.L12>:
    a0e3:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a0e9:	8d 93 cc ca ff ff    	lea    -0x3534(%ebx),%edx
    a0ef:	e8 7c ff ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a0f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    a0fb:	00 
    a0fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

0000a100 <.L9>:
    a100:	83 ec 0c             	sub    $0xc,%esp
    a103:	6a 01                	push   $0x1
    a105:	e8 26 82 ff ff       	call   2330 <exit@plt>

0000a10a <.L10>:
    a10a:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a110:	8d 93 e0 cd ff ff    	lea    -0x3220(%ebx),%edx
    a116:	e8 55 ff ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a11b:	eb e3                	jmp    a100 <.L9>

0000a11d <.L16>:
    a11d:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a123:	8d 93 f0 ca ff ff    	lea    -0x3510(%ebx),%edx
    a129:	e8 42 ff ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a12e:	eb d0                	jmp    a100 <.L9>

0000a130 <.L15>:
    a130:	8b 54 24 14          	mov    0x14(%esp),%edx
    a134:	8b 4a 08             	mov    0x8(%edx),%ecx
    a137:	49                   	dec    %ecx
    a138:	83 f9 07             	cmp    $0x7,%ecx
    a13b:	0f 87 b0 01 00 00    	ja     a2f1 <.L28+0x2c>
    a141:	8b 84 8b d4 cf ff ff 	mov    -0x302c(%ebx,%ecx,4),%eax
    a148:	01 d8                	add    %ebx,%eax
    a14a:	ff e0                	jmp    *%eax

0000a14c <.L14>:
    a14c:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a152:	8d 93 20 ce ff ff    	lea    -0x31e0(%ebx),%edx
    a158:	e8 13 ff ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a15d:	eb a1                	jmp    a100 <.L9>

0000a15f <.L13>:
    a15f:	8b 54 24 14          	mov    0x14(%esp),%edx
    a163:	8b 4a 08             	mov    0x8(%edx),%ecx
    a166:	49                   	dec    %ecx
    a167:	83 f9 07             	cmp    $0x7,%ecx
    a16a:	0f 87 6b 01 00 00    	ja     a2db <.L28+0x16>
    a170:	8b 84 8b f4 cf ff ff 	mov    -0x300c(%ebx,%ecx,4),%eax
    a177:	01 d8                	add    %ebx,%eax
    a179:	ff e0                	jmp    *%eax

0000a17b <.L20>:
    a17b:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a181:	8d 93 34 cc ff ff    	lea    -0x33cc(%ebx),%edx
    a187:	e8 e4 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a18c:	e9 6f ff ff ff       	jmp    a100 <.L9>

0000a191 <.L21>:
    a191:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a197:	8d 93 04 cc ff ff    	lea    -0x33fc(%ebx),%edx
    a19d:	e8 ce fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a1a2:	e9 59 ff ff ff       	jmp    a100 <.L9>

0000a1a7 <.L22>:
    a1a7:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a1ad:	8d 93 d8 cb ff ff    	lea    -0x3428(%ebx),%edx
    a1b3:	e8 b8 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a1b8:	e9 43 ff ff ff       	jmp    a100 <.L9>

0000a1bd <.L23>:
    a1bd:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a1c3:	8d 93 ac cb ff ff    	lea    -0x3454(%ebx),%edx
    a1c9:	e8 a2 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a1ce:	e9 2d ff ff ff       	jmp    a100 <.L9>

0000a1d3 <.L24>:
    a1d3:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a1d9:	8d 93 7c cb ff ff    	lea    -0x3484(%ebx),%edx
    a1df:	e8 8c fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a1e4:	e9 17 ff ff ff       	jmp    a100 <.L9>

0000a1e9 <.L25>:
    a1e9:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a1ef:	8d 93 58 cb ff ff    	lea    -0x34a8(%ebx),%edx
    a1f5:	e8 76 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a1fa:	e9 01 ff ff ff       	jmp    a100 <.L9>

0000a1ff <.L26>:
    a1ff:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a205:	8d 93 30 cb ff ff    	lea    -0x34d0(%ebx),%edx
    a20b:	e8 60 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a210:	e9 eb fe ff ff       	jmp    a100 <.L9>

0000a215 <.L18>:
    a215:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a21b:	8d 93 68 cc ff ff    	lea    -0x3398(%ebx),%edx
    a221:	e8 4a fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a226:	e9 d5 fe ff ff       	jmp    a100 <.L9>

0000a22b <.L30>:
    a22b:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a231:	8d 93 70 cd ff ff    	lea    -0x3290(%ebx),%edx
    a237:	e8 34 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a23c:	e9 bf fe ff ff       	jmp    a100 <.L9>

0000a241 <.L31>:
    a241:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a247:	8d 93 48 cd ff ff    	lea    -0x32b8(%ebx),%edx
    a24d:	e8 1e fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a252:	e9 a9 fe ff ff       	jmp    a100 <.L9>

0000a257 <.L32>:
    a257:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a25d:	8d 93 24 cd ff ff    	lea    -0x32dc(%ebx),%edx
    a263:	e8 08 fe ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a268:	e9 93 fe ff ff       	jmp    a100 <.L9>

0000a26d <.L33>:
    a26d:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a273:	8d 93 70 c5 ff ff    	lea    -0x3a90(%ebx),%edx
    a279:	e8 f2 fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a27e:	e9 7d fe ff ff       	jmp    a100 <.L9>

0000a283 <.L34>:
    a283:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a289:	8d 93 f8 cc ff ff    	lea    -0x3308(%ebx),%edx
    a28f:	e8 dc fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a294:	e9 67 fe ff ff       	jmp    a100 <.L9>

0000a299 <.L35>:
    a299:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a29f:	8d 93 d4 cc ff ff    	lea    -0x332c(%ebx),%edx
    a2a5:	e8 c6 fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a2aa:	e9 51 fe ff ff       	jmp    a100 <.L9>

0000a2af <.L36>:
    a2af:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a2b5:	8d 93 b4 cc ff ff    	lea    -0x334c(%ebx),%edx
    a2bb:	e8 b0 fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a2c0:	e9 3b fe ff ff       	jmp    a100 <.L9>

0000a2c5 <.L28>:
    a2c5:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a2cb:	8d 93 94 cd ff ff    	lea    -0x326c(%ebx),%edx
    a2d1:	e8 9a fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a2d6:	e9 25 fe ff ff       	jmp    a100 <.L9>
    a2db:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a2e1:	8d 93 90 cc ff ff    	lea    -0x3370(%ebx),%edx
    a2e7:	e8 84 fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a2ec:	e9 0f fe ff ff       	jmp    a100 <.L9>
    a2f1:	8b 83 3c 01 00 00    	mov    0x13c(%ebx),%eax
    a2f7:	8d 93 bc cd ff ff    	lea    -0x3244(%ebx),%edx
    a2fd:	e8 6e fd ff ff       	call   a070 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0>
    a302:	e9 f9 fd ff ff       	jmp    a100 <.L9>
    a307:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    a30e:	00 
    a30f:	90                   	nop

0000a310 <_Z18set_signal_handlerv>:
    a310:	55                   	push   %ebp
    a311:	c5 f9 ef c0          	vpxor  %xmm0,%xmm0,%xmm0
    a315:	89 e5                	mov    %esp,%ebp
    a317:	56                   	push   %esi
    a318:	53                   	push   %ebx
    a319:	51                   	push   %ecx
    a31a:	e8 11 95 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    a31f:	81 c3 9d 4b 00 00    	add    $0x4b9d,%ebx
    a325:	81 ec a8 00 00 00    	sub    $0xa8,%esp
    a32b:	8d 95 5c ff ff ff    	lea    -0xa4(%ebp),%edx
    a331:	8d b5 58 ff ff ff    	lea    -0xa8(%ebp),%esi
    a337:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
    a33d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a340:	31 c0                	xor    %eax,%eax
    a342:	62 f1 7f 48 7f 85 9c 	vmovdqu8 %zmm0,-0x64(%ebp)
    a349:	ff ff ff 
    a34c:	62 f1 7f 08 7f 85 d4 	vmovdqu8 %xmm0,-0x2c(%ebp)
    a353:	ff ff ff 
    a356:	62 f1 7f 48 7f 85 5c 	vmovdqu8 %zmm0,-0xa4(%ebp)
    a35d:	ff ff ff 
    a360:	8d 83 04 b2 ff ff    	lea    -0x4dfc(%ebx),%eax
    a366:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
    a36c:	52                   	push   %edx
    a36d:	c5 f8 77             	vzeroupper
    a370:	e8 bb 7e ff ff       	call   2230 <sigemptyset@plt>
    a375:	83 c4 0c             	add    $0xc,%esp
    a378:	c7 45 dc 04 00 00 08 	movl   $0x8000004,-0x24(%ebp)
    a37f:	6a 00                	push   $0x0
    a381:	56                   	push   %esi
    a382:	6a 0b                	push   $0xb
    a384:	e8 f7 7c ff ff       	call   2080 <sigaction@plt>
    a389:	83 c4 10             	add    $0x10,%esp
    a38c:	85 c0                	test   %eax,%eax
    a38e:	0f 85 d6 83 ff ff    	jne    276a <_Z18set_signal_handlerv.cold>
    a394:	83 ec 04             	sub    $0x4,%esp
    a397:	6a 00                	push   $0x0
    a399:	56                   	push   %esi
    a39a:	6a 08                	push   $0x8
    a39c:	e8 df 7c ff ff       	call   2080 <sigaction@plt>
    a3a1:	83 c4 10             	add    $0x10,%esp
    a3a4:	85 c0                	test   %eax,%eax
    a3a6:	0f 85 be 83 ff ff    	jne    276a <_Z18set_signal_handlerv.cold>
    a3ac:	83 ec 04             	sub    $0x4,%esp
    a3af:	6a 00                	push   $0x0
    a3b1:	56                   	push   %esi
    a3b2:	6a 02                	push   $0x2
    a3b4:	e8 c7 7c ff ff       	call   2080 <sigaction@plt>
    a3b9:	83 c4 10             	add    $0x10,%esp
    a3bc:	85 c0                	test   %eax,%eax
    a3be:	0f 85 a6 83 ff ff    	jne    276a <_Z18set_signal_handlerv.cold>
    a3c4:	83 ec 04             	sub    $0x4,%esp
    a3c7:	6a 00                	push   $0x0
    a3c9:	56                   	push   %esi
    a3ca:	6a 04                	push   $0x4
    a3cc:	e8 af 7c ff ff       	call   2080 <sigaction@plt>
    a3d1:	83 c4 10             	add    $0x10,%esp
    a3d4:	85 c0                	test   %eax,%eax
    a3d6:	0f 85 8e 83 ff ff    	jne    276a <_Z18set_signal_handlerv.cold>
    a3dc:	83 ec 04             	sub    $0x4,%esp
    a3df:	6a 00                	push   $0x0
    a3e1:	56                   	push   %esi
    a3e2:	6a 0f                	push   $0xf
    a3e4:	e8 97 7c ff ff       	call   2080 <sigaction@plt>
    a3e9:	83 c4 10             	add    $0x10,%esp
    a3ec:	85 c0                	test   %eax,%eax
    a3ee:	0f 85 76 83 ff ff    	jne    276a <_Z18set_signal_handlerv.cold>
    a3f4:	83 ec 04             	sub    $0x4,%esp
    a3f7:	6a 00                	push   $0x0
    a3f9:	56                   	push   %esi
    a3fa:	6a 06                	push   $0x6
    a3fc:	e8 7f 7c ff ff       	call   2080 <sigaction@plt>
    a401:	83 c4 10             	add    $0x10,%esp
    a404:	85 c0                	test   %eax,%eax
    a406:	0f 85 5e 83 ff ff    	jne    276a <_Z18set_signal_handlerv.cold>
    a40c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a40f:	65 2b 05 14 00 00 00 	sub    %gs:0x14,%eax
    a416:	75 08                	jne    a420 <_Z18set_signal_handlerv+0x110>
    a418:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a41b:	59                   	pop    %ecx
    a41c:	5b                   	pop    %ebx
    a41d:	5e                   	pop    %esi
    a41e:	5d                   	pop    %ebp
    a41f:	c3                   	ret
    a420:	e8 7b 05 00 00       	call   a9a0 <__stack_chk_fail_local>
    a425:	90                   	nop
    a426:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    a42d:	00 
    a42e:	66 90                	xchg   %ax,%ax

0000a430 <_ZN13SignalHandlerC1Ev>:
    a430:	53                   	push   %ebx
    a431:	e8 fa 93 ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    a436:	81 c3 86 4a 00 00    	add    $0x4a86,%ebx
    a43c:	83 ec 08             	sub    $0x8,%esp
    a43f:	e8 cc fe ff ff       	call   a310 <_Z18set_signal_handlerv>
    a444:	83 ec 0c             	sub    $0xc,%esp
    a447:	6a 05                	push   $0x5
    a449:	e8 b2 7e ff ff       	call   2300 <feenableexcept@plt>
    a44e:	83 c4 18             	add    $0x18,%esp
    a451:	5b                   	pop    %ebx
    a452:	c3                   	ret
    a453:	66 90                	xchg   %ax,%ax
    a455:	66 90                	xchg   %ax,%ax
    a457:	66 90                	xchg   %ax,%ax
    a459:	66 90                	xchg   %ax,%ax
    a45b:	66 90                	xchg   %ax,%ax
    a45d:	66 90                	xchg   %ax,%ax
    a45f:	90                   	nop

0000a460 <cpu_rdtsc_read>:
    a460:	53                   	push   %ebx
    a461:	31 c0                	xor    %eax,%eax
    a463:	0f a2                	cpuid
    a465:	0f 31                	rdtsc
    a467:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    a46b:	89 03                	mov    %eax,(%ebx)
    a46d:	89 53 04             	mov    %edx,0x4(%ebx)
    a470:	5b                   	pop    %ebx
    a471:	c3                   	ret
    a472:	66 90                	xchg   %ax,%ax
    a474:	66 90                	xchg   %ax,%ax
    a476:	66 90                	xchg   %ax,%ax
    a478:	66 90                	xchg   %ax,%ax
    a47a:	66 90                	xchg   %ax,%ax
    a47c:	66 90                	xchg   %ax,%ax
    a47e:	66 90                	xchg   %ax,%ax

0000a480 <saxpy_avx2_u2>:
    a480:	55                   	push   %ebp
    a481:	89 e5                	mov    %esp,%ebp
    a483:	d9 ee                	fldz
    a485:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a489:	0f 84 da 00 00 00    	je     a569 <saxpy_avx2_u2.end>
    a48f:	57                   	push   %edi
    a490:	56                   	push   %esi
    a491:	8b 7d 08             	mov    0x8(%ebp),%edi
    a494:	8b 75 0c             	mov    0xc(%ebp),%esi
    a497:	8b 55 14             	mov    0x14(%ebp),%edx
    a49a:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
    a49e:	f3 0f 10 5d 10       	movss  0x10(%ebp),%xmm3
    a4a3:	0f c6 db 00          	shufps $0x0,%xmm3,%xmm3
    a4a7:	c4 e3 65 18 db 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm3
    a4ad:	c5 fc 28 fb          	vmovaps %ymm3,%ymm7
    a4b1:	31 c9                	xor    %ecx,%ecx
    a4b3:	83 e2 f0             	and    $0xfffffff0,%edx
    a4b6:	85 d2                	test   %edx,%edx
    a4b8:	74 42                	je     a4fc <saxpy_avx2_u2.endfor_u16>

0000a4ba <saxpy_avx2_u2.for_u16>:
    a4ba:	39 d1                	cmp    %edx,%ecx
    a4bc:	7d 3e                	jge    a4fc <saxpy_avx2_u2.endfor_u16>
    a4be:	c5 fc 28 0c 8f       	vmovaps (%edi,%ecx,4),%ymm1
    a4c3:	c5 fc 28 14 8e       	vmovaps (%esi,%ecx,4),%ymm2
    a4c8:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a4cc:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a4d0:	c5 fc 29 14 8e       	vmovaps %ymm2,(%esi,%ecx,4)
    a4d5:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a4d9:	c5 fc 28 6c 8f 20    	vmovaps 0x20(%edi,%ecx,4),%ymm5
    a4df:	c5 fc 28 74 8e 20    	vmovaps 0x20(%esi,%ecx,4),%ymm6
    a4e5:	c5 d4 59 ef          	vmulps %ymm7,%ymm5,%ymm5
    a4e9:	c5 cc 58 f5          	vaddps %ymm5,%ymm6,%ymm6
    a4ed:	c5 fc 29 74 8e 20    	vmovaps %ymm6,0x20(%esi,%ecx,4)
    a4f3:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    a4f7:	83 c1 10             	add    $0x10,%ecx
    a4fa:	eb be                	jmp    a4ba <saxpy_avx2_u2.for_u16>

0000a4fc <saxpy_avx2_u2.endfor_u16>:
    a4fc:	8b 55 14             	mov    0x14(%ebp),%edx
    a4ff:	83 e2 0f             	and    $0xf,%edx
    a502:	83 fa 08             	cmp    $0x8,%edx
    a505:	7c 1e                	jl     a525 <saxpy_avx2_u2.last_7>
    a507:	c5 fc 28 0c 8f       	vmovaps (%edi,%ecx,4),%ymm1
    a50c:	c5 fc 28 14 8e       	vmovaps (%esi,%ecx,4),%ymm2
    a511:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a515:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a519:	c5 fc 29 14 8e       	vmovaps %ymm2,(%esi,%ecx,4)
    a51e:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a522:	83 c1 08             	add    $0x8,%ecx

0000a525 <saxpy_avx2_u2.last_7>:
    a525:	c4 e3 7d 19 c1 01    	vextractf128 $0x1,%ymm0,%xmm1
    a52b:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a52f:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a533:	c4 e3 7d 19 c1 01    	vextractf128 $0x1,%ymm0,%xmm1
    a539:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    a53d:	83 ec 04             	sub    $0x4,%esp
    a540:	f3 0f 11 04 24       	movss  %xmm0,(%esp)
    a545:	d8 04 24             	fadds  (%esp)
    a548:	83 c4 04             	add    $0x4,%esp
    a54b:	8b 55 14             	mov    0x14(%ebp),%edx
    a54e:	83 e2 07             	and    $0x7,%edx
    a551:	85 d2                	test   %edx,%edx
    a553:	74 12                	je     a567 <saxpy_avx2_u2.endfor>

0000a555 <saxpy_avx2_u2.for>:
    a555:	d9 04 8f             	flds   (%edi,%ecx,4)
    a558:	d8 4d 10             	fmuls  0x10(%ebp)
    a55b:	d8 04 8e             	fadds  (%esi,%ecx,4)
    a55e:	d9 14 8e             	fsts   (%esi,%ecx,4)
    a561:	de c1                	faddp  %st,%st(1)
    a563:	41                   	inc    %ecx
    a564:	4a                   	dec    %edx
    a565:	75 ee                	jne    a555 <saxpy_avx2_u2.for>

0000a567 <saxpy_avx2_u2.endfor>:
    a567:	5e                   	pop    %esi
    a568:	5f                   	pop    %edi

0000a569 <saxpy_avx2_u2.end>:
    a569:	89 ec                	mov    %ebp,%esp
    a56b:	5d                   	pop    %ebp
    a56c:	c3                   	ret
    a56d:	66 90                	xchg   %ax,%ax
    a56f:	90                   	nop

0000a570 <saxpy_avx2_u4>:
    a570:	55                   	push   %ebp
    a571:	89 e5                	mov    %esp,%ebp
    a573:	d9 ee                	fldz
    a575:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a579:	0f 84 6a 01 00 00    	je     a6e9 <saxpy_avx2_u4.end>
    a57f:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
    a583:	f3 0f 10 5d 10       	movss  0x10(%ebp),%xmm3
    a588:	0f c6 db 00          	shufps $0x0,%xmm3,%xmm3
    a58c:	57                   	push   %edi
    a58d:	56                   	push   %esi
    a58e:	8b 7d 08             	mov    0x8(%ebp),%edi
    a591:	8b 75 0c             	mov    0xc(%ebp),%esi
    a594:	8b 55 14             	mov    0x14(%ebp),%edx
    a597:	c4 e3 65 18 db 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm3
    a59d:	c5 fc 28 fb          	vmovaps %ymm3,%ymm7
    a5a1:	31 c9                	xor    %ecx,%ecx
    a5a3:	83 e2 e0             	and    $0xffffffe0,%edx
    a5a6:	85 d2                	test   %edx,%edx
    a5a8:	74 7e                	je     a628 <saxpy_avx2_u4.endfor_u32>

0000a5aa <saxpy_avx2_u4.for_u32>:
    a5aa:	39 d1                	cmp    %edx,%ecx
    a5ac:	7d 7a                	jge    a628 <saxpy_avx2_u4.endfor_u32>
    a5ae:	c5 fc 28 0c 8f       	vmovaps (%edi,%ecx,4),%ymm1
    a5b3:	c5 fc 28 14 8e       	vmovaps (%esi,%ecx,4),%ymm2
    a5b8:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a5bc:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a5c0:	c5 fc 29 14 8e       	vmovaps %ymm2,(%esi,%ecx,4)
    a5c5:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a5c9:	c5 fc 28 6c 8f 20    	vmovaps 0x20(%edi,%ecx,4),%ymm5
    a5cf:	c5 fc 28 74 8e 20    	vmovaps 0x20(%esi,%ecx,4),%ymm6
    a5d5:	c5 d4 59 ef          	vmulps %ymm7,%ymm5,%ymm5
    a5d9:	c5 cc 58 f5          	vaddps %ymm5,%ymm6,%ymm6
    a5dd:	c5 fc 29 74 8e 20    	vmovaps %ymm6,0x20(%esi,%ecx,4)
    a5e3:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    a5e7:	c5 fc 28 4c 8f 40    	vmovaps 0x40(%edi,%ecx,4),%ymm1
    a5ed:	c5 fc 28 54 8e 40    	vmovaps 0x40(%esi,%ecx,4),%ymm2
    a5f3:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a5f7:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a5fb:	c5 fc 29 54 8e 40    	vmovaps %ymm2,0x40(%esi,%ecx,4)
    a601:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a605:	c5 fc 28 6c 8f 60    	vmovaps 0x60(%edi,%ecx,4),%ymm5
    a60b:	c5 fc 28 74 8e 60    	vmovaps 0x60(%esi,%ecx,4),%ymm6
    a611:	c5 d4 59 ef          	vmulps %ymm7,%ymm5,%ymm5
    a615:	c5 cc 58 f5          	vaddps %ymm5,%ymm6,%ymm6
    a619:	c5 fc 29 74 8e 60    	vmovaps %ymm6,0x60(%esi,%ecx,4)
    a61f:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    a623:	83 c1 20             	add    $0x20,%ecx
    a626:	eb 82                	jmp    a5aa <saxpy_avx2_u4.for_u32>

0000a628 <saxpy_avx2_u4.endfor_u32>:
    a628:	8b 55 14             	mov    0x14(%ebp),%edx
    a62b:	83 e2 1f             	and    $0x1f,%edx
    a62e:	83 fa 10             	cmp    $0x10,%edx
    a631:	7c 3c                	jl     a66f <saxpy_avx2_u4.last_15>
    a633:	c5 fc 28 0c 8f       	vmovaps (%edi,%ecx,4),%ymm1
    a638:	c5 fc 28 14 8e       	vmovaps (%esi,%ecx,4),%ymm2
    a63d:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a641:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a645:	c5 fc 29 14 8e       	vmovaps %ymm2,(%esi,%ecx,4)
    a64a:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a64e:	c5 fc 28 6c 8f 20    	vmovaps 0x20(%edi,%ecx,4),%ymm5
    a654:	c5 fc 28 74 8e 20    	vmovaps 0x20(%esi,%ecx,4),%ymm6
    a65a:	c5 d4 59 ef          	vmulps %ymm7,%ymm5,%ymm5
    a65e:	c5 cc 58 f5          	vaddps %ymm5,%ymm6,%ymm6
    a662:	c5 fc 29 74 8e 20    	vmovaps %ymm6,0x20(%esi,%ecx,4)
    a668:	c5 fc 58 c6          	vaddps %ymm6,%ymm0,%ymm0
    a66c:	83 c1 10             	add    $0x10,%ecx

0000a66f <saxpy_avx2_u4.last_15>:
    a66f:	8b 55 14             	mov    0x14(%ebp),%edx
    a672:	83 e2 0f             	and    $0xf,%edx
    a675:	83 fa 08             	cmp    $0x8,%edx
    a678:	7c 1e                	jl     a698 <saxpy_avx2_u4.last_7>
    a67a:	c5 fc 28 0c 8f       	vmovaps (%edi,%ecx,4),%ymm1
    a67f:	c5 fc 28 14 8e       	vmovaps (%esi,%ecx,4),%ymm2
    a684:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a688:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a68c:	c5 fc 29 14 8e       	vmovaps %ymm2,(%esi,%ecx,4)
    a691:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a695:	83 c1 08             	add    $0x8,%ecx

0000a698 <saxpy_avx2_u4.last_7>:
    a698:	c4 e3 7d 19 c1 01    	vextractf128 $0x1,%ymm0,%xmm1
    a69e:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a6a2:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a6a6:	c4 e3 7d 19 c1 01    	vextractf128 $0x1,%ymm0,%xmm1
    a6ac:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    a6b0:	8b 55 14             	mov    0x14(%ebp),%edx
    a6b3:	83 e2 07             	and    $0x7,%edx
    a6b6:	85 d2                	test   %edx,%edx
    a6b8:	74 1f                	je     a6d9 <saxpy_avx2_u4.endfor>

0000a6ba <saxpy_avx2_u4.for>:
    a6ba:	f3 0f 10 0c 8f       	movss  (%edi,%ecx,4),%xmm1
    a6bf:	f3 0f 59 cb          	mulss  %xmm3,%xmm1
    a6c3:	f3 0f 58 0c 8e       	addss  (%esi,%ecx,4),%xmm1
    a6c8:	f3 0f 11 0c 8e       	movss  %xmm1,(%esi,%ecx,4)
    a6cd:	f3 0f 58 c1          	addss  %xmm1,%xmm0
    a6d1:	83 c1 01             	add    $0x1,%ecx
    a6d4:	83 ea 01             	sub    $0x1,%edx
    a6d7:	75 e1                	jne    a6ba <saxpy_avx2_u4.for>

0000a6d9 <saxpy_avx2_u4.endfor>:
    a6d9:	83 ec 04             	sub    $0x4,%esp
    a6dc:	f3 0f 11 04 24       	movss  %xmm0,(%esp)
    a6e1:	d8 04 24             	fadds  (%esp)
    a6e4:	83 c4 04             	add    $0x4,%esp
    a6e7:	5e                   	pop    %esi
    a6e8:	5f                   	pop    %edi

0000a6e9 <saxpy_avx2_u4.end>:
    a6e9:	89 ec                	mov    %ebp,%esp
    a6eb:	5d                   	pop    %ebp
    a6ec:	c3                   	ret
    a6ed:	66 90                	xchg   %ax,%ax
    a6ef:	90                   	nop

0000a6f0 <saxpy_avx>:
    a6f0:	55                   	push   %ebp
    a6f1:	89 e5                	mov    %esp,%ebp
    a6f3:	d9 ee                	fldz
    a6f5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a6f9:	0f 84 89 00 00 00    	je     a788 <saxpy_avx.end>
    a6ff:	57                   	push   %edi
    a700:	56                   	push   %esi
    a701:	8b 7d 08             	mov    0x8(%ebp),%edi
    a704:	8b 75 0c             	mov    0xc(%ebp),%esi
    a707:	8b 55 14             	mov    0x14(%ebp),%edx
    a70a:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
    a70e:	f3 0f 10 5d 10       	movss  0x10(%ebp),%xmm3
    a713:	0f c6 db 00          	shufps $0x0,%xmm3,%xmm3
    a717:	c4 e3 65 18 db 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm3
    a71d:	31 c9                	xor    %ecx,%ecx
    a71f:	83 e2 f8             	and    $0xfffffff8,%edx
    a722:	85 d2                	test   %edx,%edx
    a724:	74 44                	je     a76a <saxpy_avx.last_7>

0000a726 <saxpy_avx.for_u8>:
    a726:	39 d1                	cmp    %edx,%ecx
    a728:	7d 20                	jge    a74a <saxpy_avx.endfor_u8>
    a72a:	c5 fc 28 0c 8f       	vmovaps (%edi,%ecx,4),%ymm1
    a72f:	c5 fc 28 14 8e       	vmovaps (%esi,%ecx,4),%ymm2
    a734:	c5 f4 59 cb          	vmulps %ymm3,%ymm1,%ymm1
    a738:	c5 ec 58 d1          	vaddps %ymm1,%ymm2,%ymm2
    a73c:	c5 fc 29 14 8e       	vmovaps %ymm2,(%esi,%ecx,4)
    a741:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a745:	83 c1 08             	add    $0x8,%ecx
    a748:	eb dc                	jmp    a726 <saxpy_avx.for_u8>

0000a74a <saxpy_avx.endfor_u8>:
    a74a:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a74e:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a752:	c4 e3 7d 19 c1 01    	vextractf128 $0x1,%ymm0,%xmm1
    a758:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    a75c:	83 ec 04             	sub    $0x4,%esp
    a75f:	f3 0f 11 04 24       	movss  %xmm0,(%esp)
    a764:	d8 04 24             	fadds  (%esp)
    a767:	83 c4 04             	add    $0x4,%esp

0000a76a <saxpy_avx.last_7>:
    a76a:	8b 55 14             	mov    0x14(%ebp),%edx
    a76d:	83 e2 07             	and    $0x7,%edx
    a770:	85 d2                	test   %edx,%edx
    a772:	74 12                	je     a786 <saxpy_avx.endfor>

0000a774 <saxpy_avx.for>:
    a774:	d9 04 8f             	flds   (%edi,%ecx,4)
    a777:	d8 4d 10             	fmuls  0x10(%ebp)
    a77a:	d8 04 8e             	fadds  (%esi,%ecx,4)
    a77d:	d9 14 8e             	fsts   (%esi,%ecx,4)
    a780:	de c1                	faddp  %st,%st(1)
    a782:	41                   	inc    %ecx
    a783:	4a                   	dec    %edx
    a784:	75 ee                	jne    a774 <saxpy_avx.for>

0000a786 <saxpy_avx.endfor>:
    a786:	5e                   	pop    %esi
    a787:	5f                   	pop    %edi

0000a788 <saxpy_avx.end>:
    a788:	89 ec                	mov    %ebp,%esp
    a78a:	5d                   	pop    %ebp
    a78b:	c3                   	ret
    a78c:	66 90                	xchg   %ax,%ax
    a78e:	66 90                	xchg   %ax,%ax

0000a790 <saxpy_fma>:
    a790:	55                   	push   %ebp
    a791:	89 e5                	mov    %esp,%ebp
    a793:	d9 ee                	fldz
    a795:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a799:	0f 84 82 00 00 00    	je     a821 <saxpy_fma.end>
    a79f:	56                   	push   %esi
    a7a0:	57                   	push   %edi
    a7a1:	8b 75 08             	mov    0x8(%ebp),%esi
    a7a4:	8b 7d 0c             	mov    0xc(%ebp),%edi
    a7a7:	8b 55 14             	mov    0x14(%ebp),%edx
    a7aa:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
    a7ae:	f3 0f 10 5d 10       	movss  0x10(%ebp),%xmm3
    a7b3:	0f c6 db 00          	shufps $0x0,%xmm3,%xmm3
    a7b7:	c4 e3 65 18 db 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm3
    a7bd:	31 c9                	xor    %ecx,%ecx
    a7bf:	83 e2 f8             	and    $0xfffffff8,%edx
    a7c2:	85 d2                	test   %edx,%edx
    a7c4:	74 3f                	je     a805 <saxpy_fma.last_7>

0000a7c6 <saxpy_fma.for_u8>:
    a7c6:	c5 fc 28 0c 8e       	vmovaps (%esi,%ecx,4),%ymm1
    a7cb:	c5 fc 28 14 8f       	vmovaps (%edi,%ecx,4),%ymm2
    a7d0:	c4 e2 75 b8 d3       	vfmadd231ps %ymm3,%ymm1,%ymm2
    a7d5:	c5 fc 29 14 8f       	vmovaps %ymm2,(%edi,%ecx,4)
    a7da:	c5 fc 58 c2          	vaddps %ymm2,%ymm0,%ymm0
    a7de:	83 c1 08             	add    $0x8,%ecx
    a7e1:	39 d1                	cmp    %edx,%ecx
    a7e3:	7c e1                	jl     a7c6 <saxpy_fma.for_u8>
    a7e5:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a7e9:	c5 ff 7c c0          	vhaddps %ymm0,%ymm0,%ymm0
    a7ed:	c4 e3 7d 19 c1 01    	vextractf128 $0x1,%ymm0,%xmm1
    a7f3:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    a7f7:	83 ec 04             	sub    $0x4,%esp
    a7fa:	c5 fa 11 04 24       	vmovss %xmm0,(%esp)
    a7ff:	d8 04 24             	fadds  (%esp)
    a802:	83 c4 04             	add    $0x4,%esp

0000a805 <saxpy_fma.last_7>:
    a805:	8b 55 14             	mov    0x14(%ebp),%edx
    a808:	39 d1                	cmp    %edx,%ecx
    a80a:	7d 13                	jge    a81f <saxpy_fma.endfor>

0000a80c <saxpy_fma.for>:
    a80c:	d9 04 8e             	flds   (%esi,%ecx,4)
    a80f:	d8 4d 10             	fmuls  0x10(%ebp)
    a812:	d8 04 8f             	fadds  (%edi,%ecx,4)
    a815:	d9 14 8f             	fsts   (%edi,%ecx,4)
    a818:	de c1                	faddp  %st,%st(1)
    a81a:	41                   	inc    %ecx
    a81b:	39 d1                	cmp    %edx,%ecx
    a81d:	7c ed                	jl     a80c <saxpy_fma.for>

0000a81f <saxpy_fma.endfor>:
    a81f:	5f                   	pop    %edi
    a820:	5e                   	pop    %esi

0000a821 <saxpy_fma.end>:
    a821:	89 ec                	mov    %ebp,%esp
    a823:	5d                   	pop    %ebp
    a824:	c3                   	ret
    a825:	66 90                	xchg   %ax,%ax
    a827:	66 90                	xchg   %ax,%ax
    a829:	66 90                	xchg   %ax,%ax
    a82b:	66 90                	xchg   %ax,%ax
    a82d:	66 90                	xchg   %ax,%ax
    a82f:	90                   	nop

0000a830 <saxpy_fpu>:
    a830:	55                   	push   %ebp
    a831:	89 e5                	mov    %esp,%ebp
    a833:	d9 ee                	fldz
    a835:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a839:	74 22                	je     a85d <saxpy_fpu.end>
    a83b:	57                   	push   %edi
    a83c:	56                   	push   %esi
    a83d:	8b 7d 08             	mov    0x8(%ebp),%edi
    a840:	8b 75 0c             	mov    0xc(%ebp),%esi
    a843:	8b 55 14             	mov    0x14(%ebp),%edx
    a846:	31 c9                	xor    %ecx,%ecx

0000a848 <saxpy_fpu.for>:
    a848:	d9 04 8f             	flds   (%edi,%ecx,4)
    a84b:	d8 4d 10             	fmuls  0x10(%ebp)
    a84e:	d8 04 8e             	fadds  (%esi,%ecx,4)
    a851:	d9 14 8e             	fsts   (%esi,%ecx,4)
    a854:	de c1                	faddp  %st,%st(1)
    a856:	41                   	inc    %ecx
    a857:	39 d1                	cmp    %edx,%ecx
    a859:	7c ed                	jl     a848 <saxpy_fpu.for>

0000a85b <saxpy_fpu.endfor>:
    a85b:	5e                   	pop    %esi
    a85c:	5f                   	pop    %edi

0000a85d <saxpy_fpu.end>:
    a85d:	89 ec                	mov    %ebp,%esp
    a85f:	5d                   	pop    %ebp
    a860:	c3                   	ret
    a861:	66 90                	xchg   %ax,%ax
    a863:	66 90                	xchg   %ax,%ax
    a865:	66 90                	xchg   %ax,%ax
    a867:	66 90                	xchg   %ax,%ax
    a869:	66 90                	xchg   %ax,%ax
    a86b:	66 90                	xchg   %ax,%ax
    a86d:	66 90                	xchg   %ax,%ax
    a86f:	90                   	nop

0000a870 <saxpy_fpu_u4>:
    a870:	55                   	push   %ebp
    a871:	89 e5                	mov    %esp,%ebp
    a873:	d9 ee                	fldz
    a875:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a879:	74 76                	je     a8f1 <saxpy_fpu_u4.end>
    a87b:	57                   	push   %edi
    a87c:	56                   	push   %esi
    a87d:	8b 7d 08             	mov    0x8(%ebp),%edi
    a880:	8b 75 0c             	mov    0xc(%ebp),%esi
    a883:	8b 55 14             	mov    0x14(%ebp),%edx
    a886:	31 c9                	xor    %ecx,%ecx
    a888:	83 e2 fc             	and    $0xfffffffc,%edx
    a88b:	85 d2                	test   %edx,%edx
    a88d:	74 48                	je     a8d7 <saxpy_fpu_u4.last3>

0000a88f <saxpy_fpu_u4.for_u4>:
    a88f:	d9 04 8f             	flds   (%edi,%ecx,4)
    a892:	d8 4d 10             	fmuls  0x10(%ebp)
    a895:	d8 04 8e             	fadds  (%esi,%ecx,4)
    a898:	d9 14 8e             	fsts   (%esi,%ecx,4)
    a89b:	de c1                	faddp  %st,%st(1)
    a89d:	d9 44 8f 04          	flds   0x4(%edi,%ecx,4)
    a8a1:	d8 4d 10             	fmuls  0x10(%ebp)
    a8a4:	d8 44 8e 04          	fadds  0x4(%esi,%ecx,4)
    a8a8:	d9 54 8e 04          	fsts   0x4(%esi,%ecx,4)
    a8ac:	de c1                	faddp  %st,%st(1)
    a8ae:	d9 44 8f 08          	flds   0x8(%edi,%ecx,4)
    a8b2:	d8 4d 10             	fmuls  0x10(%ebp)
    a8b5:	d8 44 8e 08          	fadds  0x8(%esi,%ecx,4)
    a8b9:	d9 54 8e 08          	fsts   0x8(%esi,%ecx,4)
    a8bd:	de c1                	faddp  %st,%st(1)
    a8bf:	d9 44 8f 0c          	flds   0xc(%edi,%ecx,4)
    a8c3:	d8 4d 10             	fmuls  0x10(%ebp)
    a8c6:	d8 44 8e 0c          	fadds  0xc(%esi,%ecx,4)
    a8ca:	d9 54 8e 0c          	fsts   0xc(%esi,%ecx,4)
    a8ce:	de c1                	faddp  %st,%st(1)
    a8d0:	83 c1 04             	add    $0x4,%ecx
    a8d3:	39 d1                	cmp    %edx,%ecx
    a8d5:	7c b8                	jl     a88f <saxpy_fpu_u4.for_u4>

0000a8d7 <saxpy_fpu_u4.last3>:
    a8d7:	8b 55 14             	mov    0x14(%ebp),%edx

0000a8da <saxpy_fpu_u4.for>:
    a8da:	39 d1                	cmp    %edx,%ecx
    a8dc:	7d 11                	jge    a8ef <saxpy_fpu_u4.endfor>
    a8de:	d9 04 8f             	flds   (%edi,%ecx,4)
    a8e1:	d8 4d 10             	fmuls  0x10(%ebp)
    a8e4:	d8 04 8e             	fadds  (%esi,%ecx,4)
    a8e7:	d9 14 8e             	fsts   (%esi,%ecx,4)
    a8ea:	de c1                	faddp  %st,%st(1)
    a8ec:	41                   	inc    %ecx
    a8ed:	eb eb                	jmp    a8da <saxpy_fpu_u4.for>

0000a8ef <saxpy_fpu_u4.endfor>:
    a8ef:	5e                   	pop    %esi
    a8f0:	5f                   	pop    %edi

0000a8f1 <saxpy_fpu_u4.end>:
    a8f1:	89 ec                	mov    %ebp,%esp
    a8f3:	5d                   	pop    %ebp
    a8f4:	c3                   	ret
    a8f5:	66 90                	xchg   %ax,%ax
    a8f7:	66 90                	xchg   %ax,%ax
    a8f9:	66 90                	xchg   %ax,%ax
    a8fb:	66 90                	xchg   %ax,%ax
    a8fd:	66 90                	xchg   %ax,%ax
    a8ff:	90                   	nop

0000a900 <saxpy_sse>:
    a900:	55                   	push   %ebp
    a901:	89 e5                	mov    %esp,%ebp
    a903:	d9 ee                	fldz
    a905:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    a909:	0f 84 87 00 00 00    	je     a996 <saxpy_sse.end>
    a90f:	57                   	push   %edi
    a910:	56                   	push   %esi
    a911:	8b 7d 08             	mov    0x8(%ebp),%edi
    a914:	8b 75 0c             	mov    0xc(%ebp),%esi
    a917:	8b 55 14             	mov    0x14(%ebp),%edx
    a91a:	31 c9                	xor    %ecx,%ecx
    a91c:	83 e2 fc             	and    $0xfffffffc,%edx
    a91f:	85 d2                	test   %edx,%edx
    a921:	74 57                	je     a97a <saxpy_sse.last_3>
    a923:	0f 57 c0             	xorps  %xmm0,%xmm0
    a926:	f3 0f 10 5d 10       	movss  0x10(%ebp),%xmm3
    a92b:	0f c6 db 00          	shufps $0x0,%xmm3,%xmm3

0000a92f <saxpy_sse.for_u4>:
    a92f:	0f 28 0c 8f          	movaps (%edi,%ecx,4),%xmm1
    a933:	0f 28 14 8e          	movaps (%esi,%ecx,4),%xmm2
    a937:	0f 59 cb             	mulps  %xmm3,%xmm1
    a93a:	0f 58 d1             	addps  %xmm1,%xmm2
    a93d:	0f 29 14 8e          	movaps %xmm2,(%esi,%ecx,4)
    a941:	0f 58 c2             	addps  %xmm2,%xmm0
    a944:	83 c1 04             	add    $0x4,%ecx
    a947:	39 d1                	cmp    %edx,%ecx
    a949:	7c e4                	jl     a92f <saxpy_sse.for_u4>
    a94b:	83 ec 10             	sub    $0x10,%esp
    a94e:	f3 0f 7f 04 24       	movdqu %xmm0,(%esp)
    a953:	f3 0f 58 44 24 04    	addss  0x4(%esp),%xmm0
    a959:	f3 0f 58 44 24 08    	addss  0x8(%esp),%xmm0
    a95f:	f3 0f 58 44 24 0c    	addss  0xc(%esp),%xmm0
    a965:	0f c6 c0 00          	shufps $0x0,%xmm0,%xmm0
    a969:	83 c4 10             	add    $0x10,%esp
    a96c:	83 ec 04             	sub    $0x4,%esp
    a96f:	f3 0f 11 04 24       	movss  %xmm0,(%esp)
    a974:	d8 04 24             	fadds  (%esp)
    a977:	83 c4 04             	add    $0x4,%esp

0000a97a <saxpy_sse.last_3>:
    a97a:	8b 55 14             	mov    0x14(%ebp),%edx
    a97d:	39 d1                	cmp    %edx,%ecx
    a97f:	7d 13                	jge    a994 <saxpy_sse.endfor>

0000a981 <saxpy_sse.for>:
    a981:	d9 04 8f             	flds   (%edi,%ecx,4)
    a984:	d8 4d 10             	fmuls  0x10(%ebp)
    a987:	d8 04 8e             	fadds  (%esi,%ecx,4)
    a98a:	d9 14 8e             	fsts   (%esi,%ecx,4)
    a98d:	de c1                	faddp  %st,%st(1)
    a98f:	41                   	inc    %ecx
    a990:	39 d1                	cmp    %edx,%ecx
    a992:	7c ed                	jl     a981 <saxpy_sse.for>

0000a994 <saxpy_sse.endfor>:
    a994:	5e                   	pop    %esi
    a995:	5f                   	pop    %edi

0000a996 <saxpy_sse.end>:
    a996:	89 ec                	mov    %ebp,%esp
    a998:	5d                   	pop    %ebp
    a999:	c3                   	ret
    a99a:	66 90                	xchg   %ax,%ax
    a99c:	66 90                	xchg   %ax,%ax
    a99e:	66 90                	xchg   %ax,%ax

0000a9a0 <__stack_chk_fail_local>:
    a9a0:	53                   	push   %ebx
    a9a1:	e8 8a 8e ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    a9a6:	81 c3 16 45 00 00    	add    $0x4516,%ebx
    a9ac:	83 ec 08             	sub    $0x8,%esp
    a9af:	e8 dc 78 ff ff       	call   2290 <__stack_chk_fail@plt>

Déassemblage de la section .fini :

0000a9b4 <_fini>:
    a9b4:	53                   	push   %ebx
    a9b5:	83 ec 08             	sub    $0x8,%esp
    a9b8:	e8 73 8e ff ff       	call   3830 <__x86.get_pc_thunk.bx>
    a9bd:	81 c3 ff 44 00 00    	add    $0x44ff,%ebx
    a9c3:	83 c4 08             	add    $0x8,%esp
    a9c6:	5b                   	pop    %ebx
    a9c7:	c3                   	ret
