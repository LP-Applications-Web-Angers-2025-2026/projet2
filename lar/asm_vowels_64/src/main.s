	.file	"main.cpp"
	.intel_syntax noprefix
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1335:
	.cfi_startproc
	endbr64
	mov	eax, esi
	ret
	.cfi_endproc
.LFE1335:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.globl	_Z5cv_ifPhjPj
	.type	_Z5cv_ifPhjPj, @function
_Z5cv_ifPhjPj:
.LFB3346:
	.cfi_startproc
	endbr64
	test	esi, esi
	je	.L205
	lea	ecx, -1[rsi]
	lea	rsi, 1[rdi+rcx]
	inc	rcx
	mov	rax, rdi
	and	ecx, 7
	je	.L11
	cmp	rcx, 1
	je	.L120
	cmp	rcx, 2
	je	.L121
	cmp	rcx, 3
	je	.L122
	cmp	rcx, 4
	je	.L123
	cmp	rcx, 5
	je	.L124
	cmp	rcx, 6
	je	.L125
	movzx	eax, BYTE PTR [rdi]
	cmp	al, 97
	je	.L136
	cmp	al, 101
	je	.L137
	cmp	al, 105
	je	.L138
	cmp	al, 111
	je	.L139
	cmp	al, 117
	je	.L140
	cmp	al, 121
	jne	.L20
	inc	DWORD PTR 20[rdx]
	.p2align 4,,10
	.p2align 3
.L20:
	lea	rax, 1[rdi]
.L125:
	movzx	edi, BYTE PTR [rax]
	cmp	dil, 97
	je	.L141
	cmp	dil, 101
	je	.L142
	cmp	dil, 105
	je	.L143
	cmp	dil, 111
	je	.L144
	cmp	dil, 117
	je	.L145
	cmp	dil, 121
	jne	.L28
	inc	DWORD PTR 20[rdx]
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L200:
	inc	DWORD PTR [rdx]
.L118:
	lea	rax, 7[r8]
	cmp	rsi, rax
	je	.L206
.L11:
	movzx	edi, BYTE PTR [rax]
	cmp	dil, 97
	je	.L207
	cmp	dil, 101
	je	.L208
	cmp	dil, 105
	je	.L209
	cmp	dil, 111
	je	.L210
	cmp	dil, 117
	je	.L211
	cmp	dil, 121
	jne	.L6
	inc	DWORD PTR 20[rdx]
	jmp	.L6
.L141:
	inc	DWORD PTR [rdx]
.L28:
	inc	rax
.L124:
	movzx	r8d, BYTE PTR [rax]
	cmp	r8b, 97
	je	.L146
	cmp	r8b, 101
	jne	.L212
	inc	DWORD PTR 4[rdx]
.L36:
	inc	rax
.L123:
	movzx	r9d, BYTE PTR [rax]
	cmp	r9b, 97
	je	.L151
	cmp	r9b, 101
	jne	.L213
	inc	DWORD PTR 4[rdx]
.L44:
	inc	rax
.L122:
	movzx	r10d, BYTE PTR [rax]
	cmp	r10b, 97
	je	.L156
	cmp	r10b, 101
	je	.L157
	cmp	r10b, 105
	je	.L158
	cmp	r10b, 111
	je	.L159
	cmp	r10b, 117
	je	.L160
	cmp	r10b, 121
	jne	.L52
	inc	DWORD PTR 20[rdx]
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L205:
	ret
	.p2align 4,,10
	.p2align 3
.L156:
	inc	DWORD PTR [rdx]
.L52:
	inc	rax
.L121:
	movzx	r11d, BYTE PTR [rax]
	cmp	r11b, 97
	jne	.L214
	inc	DWORD PTR [rdx]
.L60:
	inc	rax
.L120:
	movzx	ecx, BYTE PTR [rax]
	cmp	cl, 97
	je	.L166
	cmp	cl, 101
	je	.L167
	cmp	cl, 105
	je	.L168
	cmp	cl, 111
	je	.L169
	cmp	cl, 117
	je	.L170
	cmp	cl, 121
	jne	.L68
	inc	DWORD PTR 20[rdx]
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L214:
	cmp	r11b, 101
	je	.L162
	cmp	r11b, 105
	je	.L163
	cmp	r11b, 111
	je	.L164
	cmp	r11b, 117
	je	.L165
	cmp	r11b, 121
	jne	.L60
	inc	DWORD PTR 20[rdx]
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L208:
	inc	DWORD PTR 4[rdx]
.L6:
	lea	r8, 1[rax]
	movzx	eax, BYTE PTR 1[rax]
	cmp	al, 97
	je	.L215
.L71:
	cmp	al, 101
	je	.L171
	cmp	al, 105
	je	.L172
	cmp	al, 111
	je	.L173
	cmp	al, 117
	je	.L174
	cmp	al, 121
	jne	.L76
	inc	DWORD PTR 20[rdx]
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L207:
	inc	DWORD PTR [rdx]
	lea	r8, 1[rax]
	movzx	eax, BYTE PTR 1[rax]
	cmp	al, 97
	jne	.L71
.L215:
	inc	DWORD PTR [rdx]
.L76:
	movzx	r9d, BYTE PTR 1[r8]
	cmp	r9b, 97
	je	.L175
	cmp	r9b, 101
	je	.L176
	cmp	r9b, 105
	je	.L177
	cmp	r9b, 111
	je	.L178
	cmp	r9b, 117
	je	.L179
	cmp	r9b, 121
	jne	.L83
	inc	DWORD PTR 20[rdx]
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L175:
	inc	DWORD PTR [rdx]
.L83:
	movzx	r10d, BYTE PTR 2[r8]
	cmp	r10b, 97
	je	.L180
	cmp	r10b, 101
	je	.L181
	cmp	r10b, 105
	je	.L182
	cmp	r10b, 111
	je	.L183
	cmp	r10b, 117
	je	.L184
	cmp	r10b, 121
	jne	.L90
	inc	DWORD PTR 20[rdx]
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L180:
	inc	DWORD PTR [rdx]
.L90:
	movzx	r11d, BYTE PTR 3[r8]
	cmp	r11b, 97
	je	.L185
	cmp	r11b, 101
	je	.L186
	cmp	r11b, 105
	je	.L187
	cmp	r11b, 111
	je	.L188
	cmp	r11b, 117
	je	.L189
	cmp	r11b, 121
	jne	.L97
	inc	DWORD PTR 20[rdx]
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L185:
	inc	DWORD PTR [rdx]
.L97:
	movzx	ecx, BYTE PTR 4[r8]
	cmp	cl, 97
	je	.L190
	cmp	cl, 101
	je	.L191
	cmp	cl, 105
	je	.L192
	cmp	cl, 111
	je	.L193
	cmp	cl, 117
	je	.L194
	cmp	cl, 121
	jne	.L104
	inc	DWORD PTR 20[rdx]
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L190:
	inc	DWORD PTR [rdx]
.L104:
	movzx	edi, BYTE PTR 5[r8]
	cmp	dil, 97
	je	.L195
	cmp	dil, 101
	je	.L196
	cmp	dil, 105
	je	.L197
	cmp	dil, 111
	je	.L198
	cmp	dil, 117
	je	.L199
	cmp	dil, 121
	jne	.L111
	inc	DWORD PTR 20[rdx]
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L195:
	inc	DWORD PTR [rdx]
.L111:
	movzx	eax, BYTE PTR 6[r8]
	cmp	al, 97
	je	.L200
	cmp	al, 101
	je	.L201
	cmp	al, 105
	je	.L202
	cmp	al, 111
	je	.L203
	cmp	al, 117
	je	.L204
	cmp	al, 121
	jne	.L118
	inc	DWORD PTR 20[rdx]
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L166:
	inc	DWORD PTR [rdx]
.L68:
	inc	rax
	cmp	rsi, rax
	jne	.L11
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	inc	DWORD PTR 4[rdx]
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L176:
	inc	DWORD PTR 4[rdx]
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L181:
	inc	DWORD PTR 4[rdx]
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L186:
	inc	DWORD PTR 4[rdx]
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L191:
	inc	DWORD PTR 4[rdx]
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L196:
	inc	DWORD PTR 4[rdx]
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L201:
	inc	DWORD PTR 4[rdx]
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L213:
	cmp	r9b, 105
	je	.L153
	cmp	r9b, 111
	je	.L154
	cmp	r9b, 117
	je	.L155
	cmp	r9b, 121
	jne	.L44
	inc	DWORD PTR 20[rdx]
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L167:
	inc	DWORD PTR 4[rdx]
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L212:
	cmp	r8b, 105
	je	.L148
	cmp	r8b, 111
	je	.L149
	cmp	r8b, 117
	je	.L150
	cmp	r8b, 121
	jne	.L36
	inc	DWORD PTR 20[rdx]
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L206:
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	inc	DWORD PTR 8[rdx]
	jmp	.L60
.L183:
	inc	DWORD PTR 12[rdx]
	jmp	.L90
.L178:
	inc	DWORD PTR 12[rdx]
	jmp	.L83
.L193:
	inc	DWORD PTR 12[rdx]
	jmp	.L104
.L188:
	inc	DWORD PTR 12[rdx]
	jmp	.L97
.L173:
	inc	DWORD PTR 12[rdx]
	jmp	.L76
.L203:
	inc	DWORD PTR 12[rdx]
	jmp	.L118
.L198:
	inc	DWORD PTR 12[rdx]
	jmp	.L111
.L210:
	inc	DWORD PTR 12[rdx]
	jmp	.L6
.L158:
	inc	DWORD PTR 8[rdx]
	jmp	.L52
.L169:
	inc	DWORD PTR 12[rdx]
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L151:
	inc	DWORD PTR [rdx]
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L162:
	inc	DWORD PTR 4[rdx]
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L182:
	inc	DWORD PTR 8[rdx]
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L197:
	inc	DWORD PTR 8[rdx]
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L177:
	inc	DWORD PTR 8[rdx]
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L172:
	inc	DWORD PTR 8[rdx]
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L202:
	inc	DWORD PTR 8[rdx]
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L209:
	inc	DWORD PTR 8[rdx]
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L192:
	inc	DWORD PTR 8[rdx]
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L187:
	inc	DWORD PTR 8[rdx]
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L157:
	inc	DWORD PTR 4[rdx]
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L168:
	inc	DWORD PTR 8[rdx]
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L146:
	inc	DWORD PTR [rdx]
	jmp	.L36
.L153:
	inc	DWORD PTR 8[rdx]
	jmp	.L44
.L164:
	inc	DWORD PTR 12[rdx]
	jmp	.L60
.L184:
	inc	DWORD PTR 16[rdx]
	jmp	.L90
.L211:
	inc	DWORD PTR 16[rdx]
	jmp	.L6
.L194:
	inc	DWORD PTR 16[rdx]
	jmp	.L104
.L204:
	inc	DWORD PTR 16[rdx]
	jmp	.L118
.L199:
	inc	DWORD PTR 16[rdx]
	jmp	.L111
.L174:
	inc	DWORD PTR 16[rdx]
	jmp	.L76
.L189:
	inc	DWORD PTR 16[rdx]
	jmp	.L97
.L179:
	inc	DWORD PTR 16[rdx]
	jmp	.L83
.L159:
	inc	DWORD PTR 12[rdx]
	jmp	.L52
.L170:
	inc	DWORD PTR 16[rdx]
	jmp	.L68
.L137:
	inc	DWORD PTR 4[rdx]
	jmp	.L20
.L144:
	inc	DWORD PTR 12[rdx]
	jmp	.L28
.L150:
	inc	DWORD PTR 16[rdx]
	jmp	.L36
.L142:
	inc	DWORD PTR 4[rdx]
	jmp	.L28
.L148:
	inc	DWORD PTR 8[rdx]
	jmp	.L36
.L154:
	inc	DWORD PTR 12[rdx]
	jmp	.L44
.L165:
	inc	DWORD PTR 16[rdx]
	jmp	.L60
.L136:
	inc	DWORD PTR [rdx]
	jmp	.L20
.L160:
	inc	DWORD PTR 16[rdx]
	jmp	.L52
.L143:
	inc	DWORD PTR 8[rdx]
	jmp	.L28
.L149:
	inc	DWORD PTR 12[rdx]
	jmp	.L36
.L155:
	inc	DWORD PTR 16[rdx]
	jmp	.L44
.L138:
	inc	DWORD PTR 8[rdx]
	jmp	.L20
.L145:
	inc	DWORD PTR 16[rdx]
	jmp	.L28
.L139:
	inc	DWORD PTR 12[rdx]
	jmp	.L20
.L140:
	inc	DWORD PTR 16[rdx]
	jmp	.L20
	.cfi_endproc
.LFE3346:
	.size	_Z5cv_ifPhjPj, .-_Z5cv_ifPhjPj
	.p2align 4
	.globl	_Z9cv_switchPhjPj
	.type	_Z9cv_switchPhjPj, @function
_Z9cv_switchPhjPj:
.LFB3347:
	.cfi_startproc
	endbr64
	test	esi, esi
	je	.L231
	lea	eax, -1[rsi]
	lea	rsi, 1[rdi+rax]
	lea	rcx, .L220[rip]
	.p2align 4,,10
	.p2align 3
.L226:
	movzx	r8d, BYTE PTR [rdi]
	sub	r8d, 97
	cmp	r8b, 24
	ja	.L218
	movzx	r9d, r8b
	movsx	r10, DWORD PTR [rcx+r9*4]
	add	r10, rcx
	notrack jmp	r10
	.section	.rodata
	.align 4
	.align 4
.L220:
	.long	.L225-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L224-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L223-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L222-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L221-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L218-.L220
	.long	.L219-.L220
	.text
	.p2align 4,,10
	.p2align 3
.L219:
	inc	DWORD PTR 20[rdx]
	.p2align 4,,10
	.p2align 3
.L218:
	inc	rdi
	cmp	rsi, rdi
	jne	.L226
.L231:
	ret
	.p2align 4,,10
	.p2align 3
.L221:
	inc	rdi
	inc	DWORD PTR 16[rdx]
	cmp	rsi, rdi
	jne	.L226
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L222:
	inc	rdi
	inc	DWORD PTR 12[rdx]
	cmp	rsi, rdi
	jne	.L226
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L223:
	inc	rdi
	inc	DWORD PTR 8[rdx]
	cmp	rsi, rdi
	jne	.L226
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L224:
	inc	rdi
	inc	DWORD PTR 4[rdx]
	cmp	rsi, rdi
	jne	.L226
	jmp	.L231
	.p2align 4,,10
	.p2align 3
.L225:
	inc	rdi
	inc	DWORD PTR [rdx]
	cmp	rsi, rdi
	jne	.L226
	jmp	.L231
	.cfi_endproc
.LFE3347:
	.size	_Z9cv_switchPhjPj, .-_Z9cv_switchPhjPj
	.p2align 4
	.globl	_Z10cv_lettersPhjPj
	.type	_Z10cv_lettersPhjPj, @function
_Z10cv_lettersPhjPj:
.LFB3348:
	.cfi_startproc
	endbr64
	sub	rsp, 120
	.cfi_def_cfa_offset 128
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 104[rsp], rax
	xor	eax, eax
	mov	r8d, esi
	mov	r9, rdx
	mov	rcx, rsp
	xor	esi, esi
.L233:
	mov	edx, eax
	add	eax, 32
	mov	QWORD PTR [rcx+rdx], rsi
	mov	QWORD PTR 8[rcx+rdx], rsi
	mov	QWORD PTR 16[rcx+rdx], rsi
	mov	QWORD PTR 24[rcx+rdx], rsi
	cmp	eax, 96
	jb	.L233
	mov	QWORD PTR [rcx+rax], 0
	test	r8d, r8d
	je	.L238
	lea	r11d, -1[r8]
	lea	r10, 1[rdi]
	add	r11, r10
	mov	r8, r11
	sub	r8, rdi
	and	r8d, 7
	je	.L236
	cmp	r8, 1
	je	.L262
	cmp	r8, 2
	je	.L263
	cmp	r8, 3
	je	.L264
	cmp	r8, 4
	je	.L265
	cmp	r8, 5
	je	.L266
	cmp	r8, 6
	jne	.L279
.L267:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
.L266:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
.L265:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
.L264:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
.L263:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
.L262:
	movzx	eax, BYTE PTR [rdi]
	inc	rdi
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	cmp	rdi, r11
	je	.L276
.L236:
	movzx	eax, BYTE PTR [rdi]
	add	rdi, 8
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -7[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -6[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -5[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -4[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -3[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -2[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	movzx	eax, BYTE PTR -1[rdi]
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	cmp	rdi, r11
	jne	.L236
.L276:
	mov	r8d, DWORD PTR [rsp]
	mov	esi, DWORD PTR 16[rsp]
	vmovd	xmm1, DWORD PTR 32[rsp]
	mov	ecx, DWORD PTR 56[rsp]
	mov	edx, DWORD PTR 80[rsp]
	mov	edi, DWORD PTR 96[rsp]
.L235:
	vmovd	xmm2, r8d
	vpinsrd	xmm3, xmm1, ecx, 1
	vpinsrd	xmm0, xmm2, esi, 1
	mov	DWORD PTR 16[r9], edx
	mov	DWORD PTR 20[r9], edi
	vpunpcklqdq	xmm4, xmm0, xmm3
	vmovdqu	XMMWORD PTR [r9], xmm4
	mov	rax, QWORD PTR 104[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L280
	add	rsp, 120
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L279:
	.cfi_restore_state
	movzx	eax, BYTE PTR [rdi]
	mov	rdi, r10
	sub	eax, 97
	cdqe
	inc	DWORD PTR [rsp+rax*4]
	jmp	.L267
	.p2align 4,,10
	.p2align 3
.L238:
	xor	edi, edi
	xor	edx, edx
	xor	ecx, ecx
	vpxor	xmm1, xmm1, xmm1
	xor	esi, esi
	jmp	.L235
.L280:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3348:
	.size	_Z10cv_lettersPhjPj, .-_Z10cv_lettersPhjPj
	.section	.text._ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0,"axG",@progbits,_ZNSt3setIjSt4lessIjESaIjEED5Ev,comdat
	.align 2
	.p2align 4
	.type	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0, @function
_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0:
.LFB3950:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	QWORD PTR 16[rsp], rdi
	test	rdi, rdi
	je	.L336
.L299:
	mov	rax, QWORD PTR 16[rsp]
	mov	r14, QWORD PTR 24[rax]
	test	r14, r14
	je	.L283
.L298:
	mov	r15, QWORD PTR 24[r14]
	test	r15, r15
	je	.L284
.L297:
	mov	rdx, QWORD PTR 24[r15]
	mov	QWORD PTR 8[rsp], rdx
	test	rdx, rdx
	je	.L285
.L296:
	mov	rcx, QWORD PTR 8[rsp]
	mov	rbp, QWORD PTR 24[rcx]
	test	rbp, rbp
	je	.L286
.L295:
	mov	r13, QWORD PTR 24[rbp]
	test	r13, r13
	je	.L287
.L294:
	mov	r12, QWORD PTR 24[r13]
	test	r12, r12
	je	.L288
.L293:
	mov	r9, QWORD PTR 24[r12]
	test	r9, r9
	je	.L289
.L292:
	mov	rbx, QWORD PTR 24[r9]
	test	rbx, rbx
	je	.L290
.L291:
	mov	rdi, QWORD PTR 24[rbx]
	mov	QWORD PTR 24[rsp], r9
	call	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	mov	rdi, rbx
	mov	rbx, QWORD PTR 16[rbx]
	call	_ZdlPv@PLT
	test	rbx, rbx
	mov	r9, QWORD PTR 24[rsp]
	jne	.L291
.L290:
	mov	rbx, QWORD PTR 16[r9]
	mov	rdi, r9
	call	_ZdlPv@PLT
	test	rbx, rbx
	je	.L289
	mov	r9, rbx
	jmp	.L292
.L287:
	mov	r12, QWORD PTR 16[rbp]
	mov	rdi, rbp
	call	_ZdlPv@PLT
	test	r12, r12
	je	.L286
	mov	rbp, r12
	jmp	.L295
	.p2align 4,,10
	.p2align 3
.L288:
	mov	rbx, QWORD PTR 16[r13]
	mov	rdi, r13
	call	_ZdlPv@PLT
	test	rbx, rbx
	je	.L287
	mov	r13, rbx
	jmp	.L294
.L286:
	mov	rdi, QWORD PTR 8[rsp]
	mov	rbp, QWORD PTR 16[rdi]
	call	_ZdlPv@PLT
	test	rbp, rbp
	je	.L285
	mov	QWORD PTR 8[rsp], rbp
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L289:
	mov	rsi, QWORD PTR 16[r12]
	mov	rdi, r12
	mov	QWORD PTR 24[rsp], rsi
	call	_ZdlPv@PLT
	mov	rdi, QWORD PTR 24[rsp]
	test	rdi, rdi
	je	.L288
	mov	r12, rdi
	jmp	.L293
.L285:
	mov	r13, QWORD PTR 16[r15]
	mov	rdi, r15
	call	_ZdlPv@PLT
	test	r13, r13
	je	.L284
	mov	r15, r13
	jmp	.L297
.L284:
	mov	r15, QWORD PTR 16[r14]
	mov	rdi, r14
	call	_ZdlPv@PLT
	test	r15, r15
	je	.L283
	mov	r14, r15
	jmp	.L298
.L283:
	mov	rdi, QWORD PTR 16[rsp]
	mov	r14, QWORD PTR 16[rdi]
	call	_ZdlPv@PLT
	test	r14, r14
	je	.L336
	mov	QWORD PTR 16[rsp], r14
	jmp	.L299
.L336:
	add	rsp, 40
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3950:
	.size	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0, .-_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	.section	.text._ZNSt3setIjSt4lessIjESaIjEED2Ev,"axG",@progbits,_ZNSt3setIjSt4lessIjESaIjEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt3setIjSt4lessIjESaIjEED2Ev
	.type	_ZNSt3setIjSt4lessIjESaIjEED2Ev, @function
_ZNSt3setIjSt4lessIjESaIjEED2Ev:
.LFB3938:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, QWORD PTR 16[rdi]
	test	rbx, rbx
	je	.L345
.L340:
	mov	rdi, QWORD PTR 24[rbx]
	call	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	mov	rdi, rbx
	mov	rbx, QWORD PTR 16[rbx]
	call	_ZdlPv@PLT
	test	rbx, rbx
	jne	.L340
.L345:
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3938:
	.size	_ZNSt3setIjSt4lessIjESaIjEED2Ev, .-_ZNSt3setIjSt4lessIjESaIjEED2Ev
	.weak	_ZNSt3setIjSt4lessIjESaIjEED1Ev
	.set	_ZNSt3setIjSt4lessIjESaIjEED1Ev,_ZNSt3setIjSt4lessIjESaIjEED2Ev
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"basic_string::_M_construct null not valid"
	.text
	.align 2
	.p2align 4
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0:
.LFB3955:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	lea	r13, 16[rdi]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	QWORD PTR [rdi], r13
	test	rsi, rsi
	je	.L348
	mov	rbx, rdi
	mov	rdi, rsi
	mov	rbp, rsi
	call	strlen@PLT
	mov	QWORD PTR [rsp], rax
	mov	r12, rax
	cmp	rax, 15
	ja	.L361
	cmp	rax, 1
	jne	.L352
	movzx	eax, BYTE PTR 0[rbp]
	mov	BYTE PTR 16[rbx], al
.L353:
	mov	rcx, QWORD PTR [rsp]
	mov	rsi, QWORD PTR [rbx]
	mov	QWORD PTR 8[rbx], rcx
	mov	BYTE PTR [rsi+rcx], 0
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L362
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L352:
	.cfi_restore_state
	test	rax, rax
	je	.L353
	jmp	.L351
.L361:
	xor	edx, edx
	mov	rsi, rsp
	mov	rdi, rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	rdx, QWORD PTR [rsp]
	mov	QWORD PTR [rbx], rax
	mov	QWORD PTR 16[rbx], rdx
	mov	r13, rax
.L351:
	mov	rdx, r12
	mov	rsi, rbp
	mov	rdi, r13
	call	memcpy@PLT
	jmp	.L353
.L362:
	call	__stack_chk_fail@PLT
.L348:
	lea	rdi, .LC0[rip]
	call	_ZSt19__throw_logic_errorPKc@PLT
	.cfi_endproc
.LFE3955:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"compiler=gnu"
	.text
	.p2align 4
	.globl	_Z15report_compilerv
	.type	_Z15report_compilerv, @function
_Z15report_compilerv:
.LFB3331:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	edx, 12
	lea	rsi, .LC1[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rax, QWORD PTR _ZSt4cout[rip]
	lea	rdx, _ZSt4cout[rip]
	mov	rcx, QWORD PTR -24[rax]
	mov	rbp, QWORD PTR 240[rdx+rcx]
	test	rbp, rbp
	je	.L369
	cmp	BYTE PTR 56[rbp], 0
	je	.L365
	movsx	esi, BYTE PTR 67[rbp]
.L366:
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo3putEc@PLT
	mov	rdi, rax
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
	.p2align 4,,10
	.p2align 3
.L365:
	.cfi_restore_state
	mov	rdi, rbp
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rsi, QWORD PTR 0[rbp]
	lea	rdi, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rax, QWORD PTR 48[rsi]
	mov	esi, 10
	cmp	rax, rdi
	je	.L366
	mov	rdi, rbp
	call	rax
	movsx	esi, al
	jmp	.L366
.L369:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE3331:
	.size	_Z15report_compilerv, .-_Z15report_compilerv
	.section	.rodata.str1.1
.LC2:
	.string	"str="
	.text
	.p2align 4
	.globl	_Z18allocate_resourcesv
	.type	_Z18allocate_resourcesv, @function
_Z18allocate_resourcesv:
.LFB3344:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	esi, 64
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	lea	rbx, _ZSt4cout[rip]
	sub	rsp, 32
	.cfi_def_cfa_offset 64
	mov	edx, DWORD PTR size[rip]
	lea	rdi, 8[rsp]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	call	posix_memalign@PLT
	mov	rdx, QWORD PTR _ZSt4cout[rip]
	test	eax, eax
	mov	rcx, QWORD PTR -24[rdx]
	mov	eax, 0
	cmove	rax, QWORD PTR 8[rsp]
	add	rcx, rbx
	mov	esi, DWORD PTR 24[rcx]
	mov	edx, 4
	and	esi, -75
	or	esi, 8
	mov	DWORD PTR 24[rcx], esi
	mov	rdi, rbx
	lea	rsi, .LC2[rip]
	mov	QWORD PTR str[rip], rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rsi, QWORD PTR str[rip]
	mov	rdi, rbx
	call	_ZNSo9_M_insertIPKvEERSoT_@PLT
	mov	rdi, QWORD PTR [rax]
	mov	rbp, rax
	mov	r8, QWORD PTR -24[rdi]
	mov	r12, QWORD PTR 240[rax+r8]
	test	r12, r12
	je	.L384
	cmp	BYTE PTR 56[r12], 0
	je	.L373
	movsx	esi, BYTE PTR 67[r12]
.L374:
	mov	rdi, rbp
	call	_ZNSo3putEc@PLT
	mov	rdi, rax
	call	_ZNSo5flushEv@PLT
	mov	r11, QWORD PTR _ZSt4cout[rip]
	mov	edi, 19702013
	add	rbx, QWORD PTR -24[r11]
	mov	edx, DWORD PTR 24[rbx]
	xor	ebp, ebp
	and	edx, -75
	or	edx, 2
	mov	DWORD PTR 24[rbx], edx
	mov	ebx, 31093
	call	srand@PLT
	mov	ecx, DWORD PTR size[rip]
	mov	DWORD PTR 17[rsp], 1869178209
	mov	WORD PTR 21[rsp], bx
	mov	BYTE PTR 23[rsp], 0
	test	ecx, ecx
	je	.L370
	.p2align 4,,10
	.p2align 3
.L375:
	call	rand@PLT
	movsx	rsi, eax
	imul	r8, rsi, 715827883
	mov	r12d, eax
	sar	r12d, 31
	shr	r8, 32
	sub	r8d, r12d
	lea	r9d, [r8+r8*2]
	add	r9d, r9d
	sub	eax, r9d
	cdqe
	movzx	r10d, BYTE PTR 17[rsp+rax]
	mov	rax, QWORD PTR str[rip]
	mov	edi, ebp
	mov	BYTE PTR [rax+rdi], r10b
	inc	ebp
	cmp	DWORD PTR size[rip], ebp
	ja	.L375
.L370:
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L385
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L373:
	.cfi_restore_state
	mov	rdi, r12
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	r9, QWORD PTR [r12]
	lea	r10, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rax, QWORD PTR 48[r9]
	mov	esi, 10
	cmp	rax, r10
	je	.L374
	mov	rdi, r12
	call	rax
	movsx	esi, al
	jmp	.L374
.L385:
	call	__stack_chk_fail@PLT
.L384:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE3344:
	.size	_Z18allocate_resourcesv, .-_Z18allocate_resourcesv
	.p2align 4
	.globl	_Z14free_resourcesv
	.type	_Z14free_resourcesv, @function
_Z14free_resourcesv:
.LFB3345:
	.cfi_startproc
	endbr64
	mov	rdi, QWORD PTR str[rip]
	jmp	free@PLT
	.cfi_endproc
.LFE3345:
	.size	_Z14free_resourcesv, .-_Z14free_resourcesv
	.p2align 4
	.globl	_Z9are_equalPjS_Rj
	.type	_Z9are_equalPjS_Rj, @function
_Z9are_equalPjS_Rj:
.LFB3349:
	.cfi_startproc
	endbr64
	mov	eax, DWORD PTR [rsi]
	cmp	DWORD PTR [rdi], eax
	jne	.L390
	mov	ecx, DWORD PTR 4[rsi]
	cmp	DWORD PTR 4[rdi], ecx
	jne	.L391
	mov	r8d, DWORD PTR 8[rsi]
	cmp	DWORD PTR 8[rdi], r8d
	jne	.L392
	mov	r9d, DWORD PTR 12[rsi]
	cmp	DWORD PTR 12[rdi], r9d
	jne	.L393
	mov	r10d, DWORD PTR 16[rsi]
	cmp	DWORD PTR 16[rdi], r10d
	jne	.L394
	mov	esi, DWORD PTR 20[rsi]
	mov	eax, 1
	cmp	DWORD PTR 20[rdi], esi
	jne	.L396
	ret
	.p2align 4,,10
	.p2align 3
.L390:
	xor	edi, edi
.L388:
	mov	DWORD PTR [rdx], edi
	xor	eax, eax
	ret
.L391:
	mov	edi, 1
	jmp	.L388
.L396:
	mov	edi, 5
	jmp	.L388
.L392:
	mov	edi, 2
	jmp	.L388
.L393:
	mov	edi, 3
	jmp	.L388
.L394:
	mov	edi, 4
	jmp	.L388
	.cfi_endproc
.LFE3349:
	.size	_Z9are_equalPjS_Rj, .-_Z9are_equalPjS_Rj
	.section	.rodata.str1.1
.LC3:
	.string	"test"
.LC4:
	.string	" "
.LC5:
	.string	","
.LC6:
	.string	" OK"
.LC7:
	.string	" !!! FAIL !!! at index="
	.text
	.p2align 4
	.globl	_Z13validity_testv
	.type	_Z13validity_testv, @function
_Z13validity_testv:
.LFB3350:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	edx, 4
	lea	rsi, .LC3[rip]
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	lea	rdi, _ZSt4cout[rip]
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	lea	r12, _ZSt4cout[rip]
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 136
	.cfi_def_cfa_offset 192
	lea	r14, 80[rsp]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 120[rsp], rax
	xor	eax, eax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	vpxor	xmm0, xmm0, xmm0
	mov	rdi, r14
	vmovdqu	XMMWORD PTR 16[rsp], xmm0
	mov	QWORD PTR 32[rsp], 0
	call	_ZN8CPUTimerC1Ev@PLT
	mov	rdi, r14
	call	_ZN8CPUTimer5startEv@PLT
	lea	rbx, 16[rsp]
	mov	esi, DWORD PTR size[rip]
	mov	rdi, QWORD PTR str[rip]
	mov	rdx, rbx
	call	[QWORD PTR methods[rip+16]]
	mov	rdi, r14
	call	_ZN8CPUTimer4stopEv@PLT
	mov	esi, 1
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSolsEi@PLT
	mov	rbp, rax
	mov	edx, 1
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rax, QWORD PTR 0[rbp]
	mov	rsi, QWORD PTR methods[rip+24]
	mov	rdx, QWORD PTR -24[rax]
	mov	rdi, rbp
	mov	QWORD PTR 16[rbp+rdx], 35
	lea	r13, 40[rsp]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	rcx, QWORD PTR _ZSt4cout[rip]
	mov	rdi, r14
	mov	rsi, QWORD PTR -24[rcx]
	mov	QWORD PTR 16[r12+rsi], 20
	mov	rsi, r12
	call	_ZN8CPUTimer5printERSo@PLT
	.p2align 4,,10
	.p2align 3
.L398:
	mov	edx, 1
	lea	rsi, .LC5[rip]
	mov	rdi, r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR [rbx]
	mov	rdi, r12
	add	rbx, 4
	call	_ZNSo9_M_insertImEERSoT_@PLT
	cmp	rbx, r13
	jne	.L398
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	cmp	QWORD PTR methods[rip+32], 0
	je	.L399
	lea	rbp, methods[rip+32]
	mov	r15d, 2
	.p2align 4,,10
	.p2align 3
.L411:
	mov	rdx, QWORD PTR test_avoid[rip+16]
	test	rdx, rdx
	je	.L400
	lea	r10, test_avoid[rip+8]
	mov	edi, r15d
	.p2align 4,,10
	.p2align 3
.L404:
	mov	r8, QWORD PTR 16[rdx]
	mov	r9, QWORD PTR 24[rdx]
	cmp	DWORD PTR 32[rdx], r15d
	jnb	.L401
.L431:
	test	r9, r9
	je	.L402
	mov	rdx, r9
	mov	r8, QWORD PTR 16[rdx]
	mov	r9, QWORD PTR 24[rdx]
	cmp	DWORD PTR 32[rdx], r15d
	jb	.L431
.L401:
	mov	r10, rdx
	test	r8, r8
	je	.L402
	mov	rdx, r8
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L402:
	lea	r11, test_avoid[rip+8]
	cmp	r10, r11
	je	.L400
	cmp	DWORD PTR 32[r10], edi
	jbe	.L412
.L400:
	vpxor	xmm1, xmm1, xmm1
	mov	rdi, r14
	vmovdqu	XMMWORD PTR 48[rsp], xmm1
	mov	QWORD PTR 64[rsp], 0
	lea	rbx, 48[rsp]
	call	_ZN8CPUTimer5startEv@PLT
	mov	esi, DWORD PTR size[rip]
	mov	rdi, QWORD PTR str[rip]
	mov	rdx, rbx
	call	[QWORD PTR 0[rbp]]
	mov	rdi, r14
	call	_ZN8CPUTimer4stopEv@PLT
	mov	rsi, r15
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	r13, rax
	mov	edx, 1
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rax, QWORD PTR 0[r13]
	mov	rsi, QWORD PTR 8[rbp]
	mov	rcx, QWORD PTR -24[rax]
	mov	rdi, r13
	mov	QWORD PTR 16[r13+rcx], 35
	lea	r13, _ZSt4cout[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	rsi, QWORD PTR [r12]
	mov	rdi, QWORD PTR -24[rsi]
	lea	rsi, _ZSt4cout[rip]
	mov	QWORD PTR 16[r12+rdi], 20
	mov	rdi, r14
	call	_ZN8CPUTimer5printERSo@PLT
	lea	r8, 72[rsp]
	mov	QWORD PTR 8[rsp], r8
	.p2align 4,,10
	.p2align 3
.L409:
	mov	edx, 1
	lea	rsi, .LC5[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR [rbx]
	mov	rdi, r13
	add	rbx, 4
	call	_ZNSo9_M_insertImEERSoT_@PLT
	cmp	rbx, QWORD PTR 8[rsp]
	jne	.L409
	mov	r9d, DWORD PTR 48[rsp]
	cmp	DWORD PTR 16[rsp], r9d
	jne	.L415
	mov	r10d, DWORD PTR 52[rsp]
	cmp	DWORD PTR 20[rsp], r10d
	jne	.L416
	mov	edx, DWORD PTR 56[rsp]
	cmp	DWORD PTR 24[rsp], edx
	jne	.L417
	mov	r11d, DWORD PTR 60[rsp]
	cmp	DWORD PTR 28[rsp], r11d
	jne	.L418
	mov	ebx, DWORD PTR 64[rsp]
	cmp	DWORD PTR 32[rsp], ebx
	jne	.L419
	mov	eax, DWORD PTR 68[rsp]
	cmp	DWORD PTR 36[rsp], eax
	jne	.L432
	lea	rsi, .LC6[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.L410:
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.L412:
	mov	rcx, QWORD PTR 16[rbp]
	inc	r15
	add	rbp, 16
	test	rcx, rcx
	jne	.L411
.L399:
	mov	rdi, QWORD PTR str[rip]
	call	free@PLT
	xor	edi, edi
	call	exit@PLT
.L415:
	xor	r13d, r13d
.L406:
	mov	edx, 23
	lea	rsi, .LC7[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, r13d
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	jmp	.L410
.L416:
	mov	r13d, 1
	jmp	.L406
.L417:
	mov	r13d, 2
	jmp	.L406
.L418:
	mov	r13d, 3
	jmp	.L406
.L419:
	mov	r13d, 4
	jmp	.L406
.L432:
	mov	r13d, 5
	jmp	.L406
	.cfi_endproc
.LFE3350:
	.size	_Z13validity_testv, .-_Z13validity_testv
	.p2align 4
	.globl	_Z13methods_countv
	.type	_Z13methods_countv, @function
_Z13methods_countv:
.LFB3351:
	.cfi_startproc
	endbr64
	cmp	QWORD PTR methods[rip+16], 0
	je	.L436
	lea	rdx, methods[rip+32]
	mov	eax, 1
	.p2align 4,,10
	.p2align 3
.L435:
	add	rdx, 16
	mov	r8d, eax
	inc	eax
	cmp	QWORD PTR -16[rdx], 0
	jne	.L435
	mov	eax, r8d
	ret
	.p2align 4,,10
	.p2align 3
.L436:
	xor	r8d, r8d
	mov	eax, r8d
	ret
	.cfi_endproc
.LFE3351:
	.size	_Z13methods_countv, .-_Z13methods_countv
	.section	.rodata.str1.1
.LC8:
	.string	"method.id="
.LC9:
	.string	",method.name="
.LC10:
	.string	"methods.count="
	.text
	.p2align 4
	.globl	_Z12list_methodsv
	.type	_Z12list_methodsv, @function
_Z12list_methodsv:
.LFB3352:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	cmp	QWORD PTR methods[rip+16], 0
	je	.L446
	lea	rbx, methods[rip+24]
	mov	r13d, 1
	lea	r15, _ZNKSt5ctypeIcE8do_widenEc[rip]
	jmp	.L445
	.p2align 4,,10
	.p2align 3
.L452:
	movsx	esi, BYTE PTR 67[r12]
.L444:
	mov	rdi, rbp
	call	_ZNSo3putEc@PLT
	mov	rdi, rax
	call	_ZNSo5flushEv@PLT
	add	rbx, 16
	cmp	QWORD PTR 8[r14], 0
	lea	rdi, 1[r13]
	je	.L439
	mov	r13, rdi
.L445:
	mov	edx, 10
	lea	rsi, .LC8[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rsi, r13
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	rdi, rax
	mov	edx, 13
	lea	rsi, .LC9[rip]
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	r12, QWORD PTR [rbx]
	mov	r14, rbx
	test	r12, r12
	je	.L450
	mov	rdi, r12
	call	strlen@PLT
	mov	rdx, rax
	mov	rsi, r12
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L441:
	mov	rdx, QWORD PTR 0[rbp]
	mov	rcx, QWORD PTR -24[rdx]
	mov	r12, QWORD PTR 240[rbp+rcx]
	test	r12, r12
	je	.L451
	cmp	BYTE PTR 56[r12], 0
	jne	.L452
	mov	rdi, r12
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rsi, QWORD PTR [r12]
	mov	rax, QWORD PTR 48[rsi]
	mov	esi, 10
	cmp	rax, r15
	je	.L444
	mov	rdi, r12
	call	rax
	movsx	esi, al
	jmp	.L444
	.p2align 4,,10
	.p2align 3
.L450:
	mov	rax, QWORD PTR 0[rbp]
	mov	rdi, QWORD PTR -24[rax]
	add	rdi, rbp
	mov	esi, DWORD PTR 32[rdi]
	or	esi, 1
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	jmp	.L441
.L446:
	xor	r13d, r13d
	.p2align 4,,10
	.p2align 3
.L439:
	mov	edx, 14
	lea	rsi, .LC10[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rsi, r13
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	call	_Z15report_compilerv
	xor	edi, edi
	call	exit@PLT
.L451:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE3352:
	.size	_Z12list_methodsv, .-_Z12list_methodsv
	.section	.rodata.str1.1
.LC11:
	.string	"/"
.LC12:
	.string	"\033[1m"
.LC13:
	.string	"\033[0m"
.LC14:
	.string	"\t\033[1m"
.LC15:
	.string	"\033[0m\n\t\t"
.LC16:
	.string	"NAME"
.LC17:
	.string	"\t"
.LC18:
	.string	"SYNOPSIS"
.LC19:
	.string	" [OPTION]..."
.LC20:
	.string	"DESCRIPTION"
.LC21:
	.string	"\tcount vowels in a string"
.LC22:
	.string	"-h, --help"
.LC23:
	.string	"this message"
.LC24:
	.string	"-c, --copying"
.LC25:
	.string	"print GNU GPL"
.LC26:
	.string	"-l, --list"
.LC27:
	.string	"list all methods"
.LC28:
	.string	"-m, --method=INT"
.LC29:
	.string	"method used to count vowels"
.LC30:
	.string	"-n, --name=STRING"
.LC31:
	.string	"select method given its name"
.LC32:
	.string	"-s, --size=INT"
.LC33:
	.string	"size of string used"
.LC34:
	.string	"-t, --test"
	.section	.rodata.str1.8
	.align 8
.LC35:
	.string	"test of all functions for validity"
	.section	.rodata.str1.1
.LC36:
	.string	"-a, --avoid=LIST"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"comma separated list of method not to test"
	.section	.rodata.str1.1
.LC38:
	.string	"-v, --verbose"
.LC39:
	.string	"verbose mode"
.LC40:
	.string	"-z, --zillions=INT"
	.section	.rodata.str1.8
	.align 8
.LC41:
	.string	"number of times the method is repeated"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB42:
	.text
.LHOTB42:
	.p2align 4
	.globl	_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB3353:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3353
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ecx, 1
	mov	rdx, -1
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	lea	rsi, .LC11[rip]
	mov	rbx, rdi
	sub	rsp, 152
	.cfi_def_cfa_offset 176
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 136[rsp], rax
	xor	eax, eax
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12find_last_ofEPKcmm@PLT
	cmp	rax, -1
	jne	.L486
.L454:
	mov	rdi, rsp
	lea	rsi, .LC12[rip]
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE0:
	lea	rdi, 32[rsp]
	lea	rsi, .LC13[rip]
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE1:
	lea	rdi, 64[rsp]
	lea	rsi, .LC14[rip]
.LEHB2:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE2:
	lea	rdi, 96[rsp]
	lea	rsi, .LC15[rip]
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE3:
	mov	rdx, QWORD PTR 8[rsp]
	mov	rsi, QWORD PTR [rsp]
	lea	rdi, _ZSt4cout[rip]
.LEHB4:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 4
	lea	rsi, .LC16[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 40[rsp]
	mov	rsi, QWORD PTR 32[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	edx, 1
	lea	rsi, .LC17[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 8[rbx]
	mov	rsi, QWORD PTR [rbx]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 8[rsp]
	mov	rsi, QWORD PTR [rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 8
	lea	rsi, .LC18[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 40[rsp]
	mov	rsi, QWORD PTR 32[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	edx, 1
	lea	rsi, .LC17[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 8[rbx]
	mov	rsi, QWORD PTR [rbx]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 12
	lea	rsi, .LC19[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdi, rbx
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 8[rsp]
	mov	rsi, QWORD PTR [rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 11
	lea	rsi, .LC20[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 40[rsp]
	mov	rsi, QWORD PTR 32[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	edx, 25
	lea	rsi, .LC21[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 10
	lea	rsi, .LC22[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 12
	lea	rsi, .LC23[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 13
	lea	rsi, .LC24[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 13
	lea	rsi, .LC25[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 10
	lea	rsi, .LC26[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 16
	lea	rsi, .LC27[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 16
	lea	rsi, .LC28[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 27
	lea	rsi, .LC29[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 17
	lea	rsi, .LC30[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 28
	lea	rsi, .LC31[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 14
	lea	rsi, .LC32[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 19
	lea	rsi, .LC33[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 10
	lea	rsi, .LC34[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 34
	lea	rsi, .LC35[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 16
	lea	rsi, .LC36[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 42
	lea	rsi, .LC37[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 13
	lea	rsi, .LC38[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 12
	lea	rsi, .LC39[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdx, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 18
	lea	rsi, .LC40[rip]
	mov	rdi, rax
	mov	rbp, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 96[rsp]
	mov	rdi, rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 38
	lea	rsi, .LC41[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.LEHE4:
	xor	edi, edi
	call	exit@PLT
.L486:
	lea	rdi, 96[rsp]
	lea	rdx, 1[rax]
	or	rcx, -1
	mov	rsi, rbx
.LEHB5:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE5:
	mov	rdx, QWORD PTR 96[rsp]
	lea	rbp, 112[rsp]
	mov	rdi, QWORD PTR [rbx]
	cmp	rdx, rbp
	je	.L487
	lea	rcx, 16[rbx]
	vmovq	xmm0, QWORD PTR 104[rsp]
	mov	rsi, QWORD PTR 112[rsp]
	cmp	rdi, rcx
	je	.L459
	vpinsrq	xmm2, xmm0, rsi, 1
	mov	rax, QWORD PTR 16[rbx]
	mov	QWORD PTR [rbx], rdx
	vmovdqu	XMMWORD PTR 8[rbx], xmm2
	test	rdi, rdi
	je	.L460
	mov	QWORD PTR 96[rsp], rdi
	mov	QWORD PTR 112[rsp], rax
.L458:
	mov	rdi, QWORD PTR 96[rsp]
	mov	QWORD PTR 104[rsp], 0
	mov	BYTE PTR [rdi], 0
	mov	rdi, QWORD PTR 96[rsp]
	cmp	rdi, rbp
	je	.L454
	call	_ZdlPv@PLT
	jmp	.L454
.L487:
	mov	rdx, QWORD PTR 104[rsp]
	test	rdx, rdx
	je	.L456
	cmp	rdx, 1
	je	.L488
	mov	rsi, rbp
	call	memcpy@PLT
	mov	rdi, QWORD PTR [rbx]
	mov	rdx, QWORD PTR 104[rsp]
.L456:
	mov	QWORD PTR 8[rbx], rdx
	mov	BYTE PTR [rdi+rdx], 0
	jmp	.L458
.L459:
	mov	QWORD PTR [rbx], rdx
	vpinsrq	xmm1, xmm0, rsi, 1
	vmovdqu	XMMWORD PTR 8[rbx], xmm1
.L460:
	mov	QWORD PTR 96[rsp], rbp
	jmp	.L458
.L488:
	movzx	r8d, BYTE PTR 112[rsp]
	mov	BYTE PTR [rdi], r8b
	mov	rdi, QWORD PTR [rbx]
	mov	rdx, QWORD PTR 104[rsp]
	jmp	.L456
.L474:
	endbr64
	mov	rbx, rax
	jmp	.L462
.L473:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L464
.L472:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L466
.L471:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L468
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3353:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3353-.LLSDACSB3353
.LLSDACSB3353:
	.uleb128 .LEHB0-.LFB3353
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3353
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L471-.LFB3353
	.uleb128 0
	.uleb128 .LEHB2-.LFB3353
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L472-.LFB3353
	.uleb128 0
	.uleb128 .LEHB3-.LFB3353
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L473-.LFB3353
	.uleb128 0
	.uleb128 .LEHB4-.LFB3353
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L474-.LFB3353
	.uleb128 0
	.uleb128 .LEHB5-.LFB3353
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE3353:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3353
	.type	_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold, @function
_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold:
.LFSB3353:
.L462:
	.cfi_def_cfa_offset 176
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	mov	rdi, QWORD PTR 96[rsp]
	lea	r9, 112[rsp]
	cmp	rdi, r9
	je	.L484
	vzeroupper
	call	_ZdlPv@PLT
.L464:
	mov	rdi, QWORD PTR 64[rsp]
	lea	r10, 80[rsp]
	cmp	rdi, r10
	je	.L466
	call	_ZdlPv@PLT
.L466:
	mov	rdi, QWORD PTR 32[rsp]
	lea	r11, 48[rsp]
	cmp	rdi, r11
	je	.L468
	call	_ZdlPv@PLT
.L468:
	mov	rdi, QWORD PTR [rsp]
	lea	rdx, 16[rsp]
	cmp	rdi, rdx
	je	.L469
	call	_ZdlPv@PLT
.L469:
	mov	rdi, rbx
.LEHB6:
	call	_Unwind_Resume@PLT
.LEHE6:
.L484:
	vzeroupper
	jmp	.L464
	.cfi_endproc
.LFE3353:
	.section	.gcc_except_table
.LLSDAC3353:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3353-.LLSDACSBC3353
.LLSDACSBC3353:
	.uleb128 .LEHB6-.LCOLDB42
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSEC3353:
	.section	.text.unlikely
	.text
	.size	_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text.unlikely
	.size	_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold, .-_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold
.LCOLDE42:
	.text
.LHOTE42:
	.section	.rodata.str1.1
.LC43:
	.string	""
.LC44:
	.string	"stoi"
	.section	.text.unlikely
.LCOLDB45:
	.text
.LHOTB45:
	.p2align 4
	.globl	_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc
	.type	_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc, @function
_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc:
.LFB3357:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3357
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 544
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 536[rsp], rax
	xor	eax, eax
	lea	rax, 112[rsp]
	cmp	QWORD PTR 8[rsi], 0
	mov	QWORD PTR 24[rsp], rax
	mov	QWORD PTR 96[rsp], rax
	mov	QWORD PTR 104[rsp], 0
	mov	BYTE PTR 112[rsp], 0
	je	.L489
	mov	r15d, edx
	mov	rdx, QWORD PTR [rsi]
	mov	r13, rdi
	cmp	BYTE PTR [rdx], 61
	mov	rbx, rsi
	je	.L491
.L493:
	lea	rdi, 248[rsp]
	lea	r14, 128[rsp]
	mov	QWORD PTR 40[rsp], rdi
	mov	QWORD PTR 64[rsp], r14
	call	_ZNSt8ios_baseC2Ev@PLT
	xor	esi, esi
	mov	WORD PTR 472[rsp], si
	mov	r8, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+8]
	vpxor	xmm0, xmm0, xmm0
	vmovdqa	YMMWORD PTR 480[rsp], ymm0
	mov	r9, QWORD PTR -24[r8]
	mov	r10, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+16]
	lea	rcx, _ZTVSt9basic_iosIcSt11char_traitsIcEE[rip+16]
	mov	QWORD PTR 248[rsp], rcx
	mov	QWORD PTR 464[rsp], 0
	mov	QWORD PTR 128[rsp], r8
	mov	QWORD PTR 128[rsp+r9], r10
	mov	QWORD PTR 136[rsp], 0
	mov	r11, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+8]
	xor	esi, esi
	mov	rdi, QWORD PTR -24[r11]
	add	rdi, r14
	vzeroupper
.LEHB7:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE7:
	lea	r12, _ZTVNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+24]
	mov	QWORD PTR 128[rsp], r12
	lea	rax, _ZTVSt15basic_streambufIcSt11char_traitsIcEE[rip+16]
	add	r12, 40
	lea	rdi, 200[rsp]
	mov	QWORD PTR 248[rsp], r12
	mov	QWORD PTR 144[rsp], rax
	mov	QWORD PTR 152[rsp], 0
	mov	QWORD PTR 160[rsp], 0
	mov	QWORD PTR 168[rsp], 0
	mov	QWORD PTR 176[rsp], 0
	mov	QWORD PTR 184[rsp], 0
	mov	QWORD PTR 192[rsp], 0
	mov	QWORD PTR 16[rsp], rdi
	call	_ZNSt6localeC1Ev@PLT
	mov	r12, QWORD PTR 8[rbx]
	mov	rbx, QWORD PTR [rbx]
	lea	r14, 232[rsp]
	mov	rcx, rbx
	lea	rdx, _ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE[rip+16]
	add	rcx, r12
	mov	QWORD PTR 144[rsp], rdx
	mov	DWORD PTR 208[rsp], 0
	mov	QWORD PTR 32[rsp], r14
	mov	QWORD PTR 216[rsp], r14
	je	.L494
	test	rbx, rbx
	je	.L564
.L494:
	mov	QWORD PTR 88[rsp], r12
	cmp	r12, 15
	ja	.L565
	cmp	r12, 1
	jne	.L497
	movzx	r8d, BYTE PTR [rbx]
	mov	rsi, QWORD PTR 32[rsp]
	mov	BYTE PTR 232[rsp], r8b
.L498:
	mov	QWORD PTR 224[rsp], r12
	mov	BYTE PTR [rsi+r12], 0
	lea	rbx, 144[rsp]
	xor	ecx, ecx
	mov	rsi, QWORD PTR 216[rsp]
	xor	edx, edx
	mov	rdi, rbx
	mov	DWORD PTR 208[rsp], 8
.LEHB8:
	call	_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE7_M_syncEPcmm@PLT
.LEHE8:
	mov	rdi, QWORD PTR 40[rsp]
	mov	rsi, rbx
.LEHB9:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E@PLT
.LEHE9:
	movsx	r10d, r15b
	lea	r11, 96[rsp]
	lea	rax, 8[r13]
	mov	DWORD PTR 60[rsp], r10d
	mov	QWORD PTR 48[rsp], r11
	mov	QWORD PTR 72[rsp], rax
	.p2align 4,,10
	.p2align 3
.L504:
	mov	edx, DWORD PTR 60[rsp]
	mov	rsi, QWORD PTR 48[rsp]
	mov	rdi, QWORD PTR 64[rsp]
.LEHB10:
	call	_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@PLT
.LEHE10:
	mov	rdi, QWORD PTR [rax]
	mov	rdx, QWORD PTR -24[rdi]
	test	BYTE PTR 32[rax+rdx], 5
	jne	.L509
	call	__errno_location@PLT
	mov	r14, QWORD PTR 96[rsp]
	mov	r15d, DWORD PTR [rax]
	mov	DWORD PTR [rax], 0
	lea	rsi, 88[rsp]
	mov	edx, 10
	mov	rdi, r14
	mov	rbx, rax
	call	strtol@PLT
	mov	r12, rax
	cmp	r14, QWORD PTR 88[rsp]
	je	.L566
	mov	r10d, DWORD PTR [rbx]
	cmp	r10d, 34
	je	.L511
	mov	r11d, 2147483648
	add	rax, r11
	add	r11, 2147483647
	cmp	rax, r11
	ja	.L511
	test	r10d, r10d
	jne	.L513
	mov	DWORD PTR [rbx], r15d
.L513:
	mov	r14, QWORD PTR 16[r13]
	mov	r15d, r12d
	test	r14, r14
	je	.L567
	.p2align 4,,10
	.p2align 3
.L515:
	mov	edi, DWORD PTR 32[r14]
	mov	rdx, QWORD PTR 16[r14]
	mov	rcx, QWORD PTR 24[r14]
	cmp	r15d, edi
	jb	.L519
	test	rcx, rcx
	je	.L520
	mov	r14, rcx
	jmp	.L515
	.p2align 4,,10
	.p2align 3
.L509:
	lea	r14, _ZTVNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+24]
	mov	rdi, QWORD PTR 216[rsp]
	mov	QWORD PTR 128[rsp], r14
	lea	rcx, _ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE[rip+16]
	add	r14, 40
	mov	QWORD PTR 248[rsp], r14
	mov	QWORD PTR 144[rsp], rcx
	cmp	rdi, QWORD PTR 32[rsp]
	je	.L524
	call	_ZdlPv@PLT
.L524:
	mov	rdi, QWORD PTR 16[rsp]
	lea	rsi, _ZTVSt15basic_streambufIcSt11char_traitsIcEE[rip+16]
	mov	QWORD PTR 144[rsp], rsi
	call	_ZNSt6localeD1Ev@PLT
	mov	r8, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+8]
	mov	r12, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+16]
	mov	r9, QWORD PTR -24[r8]
	mov	rdi, QWORD PTR 40[rsp]
	lea	rbx, _ZTVSt9basic_iosIcSt11char_traitsIcEE[rip+16]
	mov	QWORD PTR 128[rsp], r8
	mov	QWORD PTR 128[rsp+r9], r12
	mov	QWORD PTR 136[rsp], 0
	mov	QWORD PTR 248[rsp], rbx
	call	_ZNSt8ios_baseD2Ev@PLT
	mov	rdi, QWORD PTR 96[rsp]
	cmp	rdi, QWORD PTR 24[rsp]
	je	.L489
	call	_ZdlPv@PLT
.L489:
	mov	rax, QWORD PTR 536[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L568
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L491:
	.cfi_restore_state
	xor	r8d, r8d
	lea	rcx, .LC43[rip]
	mov	edx, 1
	xor	esi, esi
	mov	rdi, rbx
.LEHB11:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm@PLT
.LEHE11:
	jmp	.L493
.L565:
	lea	rsi, 88[rsp]
	lea	rdi, 216[rsp]
	xor	edx, edx
.LEHB12:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.LEHE12:
	mov	r9, QWORD PTR 88[rsp]
	mov	QWORD PTR 216[rsp], rax
	mov	QWORD PTR 232[rsp], r9
	mov	rdi, rax
.L496:
	mov	rdx, r12
	mov	rsi, rbx
	call	memcpy@PLT
	mov	r12, QWORD PTR 88[rsp]
	mov	rsi, QWORD PTR 216[rsp]
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L519:
	test	rdx, rdx
	je	.L514
	mov	r14, rdx
	jmp	.L515
	.p2align 4,,10
	.p2align 3
.L520:
	cmp	r12d, edi
	jbe	.L504
.L527:
	mov	ebx, 1
	cmp	r14, QWORD PTR 72[rsp]
	jne	.L569
.L523:
	mov	edi, 40
.LEHB13:
	call	_Znwm@PLT
.LEHE13:
	mov	DWORD PTR 32[rax], r12d
	mov	rcx, QWORD PTR 72[rsp]
	mov	rsi, rax
	mov	rdx, r14
	movzx	edi, bl
	call	_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@PLT
	inc	QWORD PTR 40[r13]
	jmp	.L504
	.p2align 4,,10
	.p2align 3
.L567:
	mov	r14, QWORD PTR 72[rsp]
	.p2align 4,,10
	.p2align 3
.L514:
	cmp	r14, QWORD PTR 24[r13]
	je	.L527
	mov	rdi, r14
	call	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@PLT
	cmp	DWORD PTR 32[rax], r12d
	jnb	.L504
	mov	ebx, 1
	cmp	r14, QWORD PTR 72[rsp]
	je	.L523
.L569:
	cmp	r12d, DWORD PTR 32[r14]
	setb	bl
	jmp	.L523
.L497:
	test	r12, r12
	jne	.L570
	mov	rsi, QWORD PTR 32[rsp]
	jmp	.L498
.L511:
	lea	rdi, .LC44[rip]
.LEHB14:
	call	_ZSt20__throw_out_of_rangePKc@PLT
.LEHE14:
.L564:
	lea	rdi, .LC0[rip]
.LEHB15:
	call	_ZSt19__throw_logic_errorPKc@PLT
.LEHE15:
.L568:
	call	__stack_chk_fail@PLT
.L566:
	lea	rdi, .LC44[rip]
.LEHB16:
	call	_ZSt24__throw_invalid_argumentPKc@PLT
.LEHE16:
.L570:
	mov	rdi, QWORD PTR 32[rsp]
	jmp	.L496
.L539:
	endbr64
	mov	r14, rax
	jmp	.L516
.L538:
	endbr64
	mov	r13, rax
	jmp	.L563
.L536:
	endbr64
	mov	r13, rax
	jmp	.L505
.L535:
	endbr64
	mov	r14, rax
	vzeroupper
	jmp	.L507
.L534:
	endbr64
	mov	r14, rax
	jmp	.L518
.L533:
	endbr64
	mov	r14, rax
	vzeroupper
	jmp	.L508
.L537:
	endbr64
	mov	r13, rax
	vzeroupper
	jmp	.L506
	.section	.gcc_except_table
.LLSDA3357:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3357-.LLSDACSB3357
.LLSDACSB3357:
	.uleb128 .LEHB7-.LFB3357
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L535-.LFB3357
	.uleb128 0
	.uleb128 .LEHB8-.LFB3357
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L538-.LFB3357
	.uleb128 0
	.uleb128 .LEHB9-.LFB3357
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L536-.LFB3357
	.uleb128 0
	.uleb128 .LEHB10-.LFB3357
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L534-.LFB3357
	.uleb128 0
	.uleb128 .LEHB11-.LFB3357
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L533-.LFB3357
	.uleb128 0
	.uleb128 .LEHB12-.LFB3357
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L537-.LFB3357
	.uleb128 0
	.uleb128 .LEHB13-.LFB3357
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L534-.LFB3357
	.uleb128 0
	.uleb128 .LEHB14-.LFB3357
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L539-.LFB3357
	.uleb128 0
	.uleb128 .LEHB15-.LFB3357
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L537-.LFB3357
	.uleb128 0
	.uleb128 .LEHB16-.LFB3357
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L539-.LFB3357
	.uleb128 0
.LLSDACSE3357:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3357
	.type	_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold, @function
_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold:
.LFSB3357:
.L516:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	cmp	DWORD PTR [rbx], 0
	je	.L571
.L518:
	mov	rdi, QWORD PTR 64[rsp]
	vzeroupper
	call	_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
.L508:
	mov	rdi, QWORD PTR 96[rsp]
	cmp	rdi, QWORD PTR 24[rsp]
	je	.L526
	call	_ZdlPv@PLT
.L526:
	mov	rdi, r14
.LEHB17:
	call	_Unwind_Resume@PLT
.LEHE17:
.L505:
	lea	r15, _ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE[rip+16]
	mov	QWORD PTR 144[rsp], r15
.L563:
	mov	rdi, QWORD PTR 216[rsp]
	cmp	rdi, QWORD PTR 32[rsp]
	je	.L558
	vzeroupper
	call	_ZdlPv@PLT
.L506:
	mov	rdi, QWORD PTR 16[rsp]
	lea	rsi, _ZTVSt15basic_streambufIcSt11char_traitsIcEE[rip+16]
	mov	QWORD PTR 144[rsp], rsi
	call	_ZNSt6localeD1Ev@PLT
	mov	r8, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+8]
	mov	r12, QWORD PTR _ZTTNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEE[rip+16]
	mov	r9, QWORD PTR -24[r8]
	mov	QWORD PTR 128[rsp], r8
	mov	QWORD PTR 128[rsp+r9], r12
	mov	QWORD PTR 136[rsp], 0
	mov	r14, r13
.L507:
	mov	rdi, QWORD PTR 40[rsp]
	lea	r10, _ZTVSt9basic_iosIcSt11char_traitsIcEE[rip+16]
	mov	QWORD PTR 248[rsp], r10
	call	_ZNSt8ios_baseD2Ev@PLT
	jmp	.L508
.L558:
	vzeroupper
	jmp	.L506
.L571:
	mov	DWORD PTR [rbx], r15d
	jmp	.L518
	.cfi_endproc
.LFE3357:
	.section	.gcc_except_table
.LLSDAC3357:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3357-.LLSDACSBC3357
.LLSDACSBC3357:
	.uleb128 .LEHB17-.LCOLDB45
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
.LLSDACSEC3357:
	.section	.text.unlikely
	.text
	.size	_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc, .-_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc
	.section	.text.unlikely
	.size	_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold, .-_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc.cold
.LCOLDE45:
	.text
.LHOTE45:
	.section	.rodata.str1.1
.LC46:
	.string	"asm_vowels64"
.LC47:
	.string	"hlm:n:s:tvz:a:"
.LC48:
	.string	"option "
.LC49:
	.string	" with arg "
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"Error ! Check command line arguments !"
	.section	.rodata.str1.1
.LC51:
	.string	"method should be inside [1.."
.LC52:
	.string	"]"
.LC53:
	.string	"'"
.LC54:
	.string	"size="
.LC55:
	.string	"cycles="
.LC56:
	.string	"method.name="
.LC57:
	.string	"vowels.count="
.LC58:
	.string	"There is no method of name '"
	.section	.text.unlikely
.LCOLDB59:
	.section	.text.startup,"ax",@progbits
.LHOTB59:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3360:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3360
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12d, edi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	mov	rbp, rsi
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 168
	.cfi_def_cfa_offset 224
	lea	rdi, 35[rsp]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 152[rsp], rax
	xor	eax, eax
.LEHB18:
	call	_ZN13SignalHandlerC1Ev@PLT
	lea	rdi, 80[rsp]
	lea	rsi, .LC46[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE18:
	mov	r14, QWORD PTR 80[rsp]
	mov	r13, QWORD PTR 88[rsp]
	mov	rdx, r14
	lea	rax, 128[rsp]
	add	rdx, r13
	mov	QWORD PTR 8[rsp], rax
	mov	QWORD PTR 112[rsp], rax
	je	.L573
	test	r14, r14
	je	.L696
.L573:
	mov	QWORD PTR 40[rsp], r13
	cmp	r13, 15
	ja	.L697
	cmp	r13, 1
	jne	.L576
	movzx	ecx, BYTE PTR [r14]
	lea	r15, 112[rsp]
	mov	BYTE PTR 128[rsp], cl
.L577:
	mov	rsi, QWORD PTR 40[rsp]
	mov	rdi, QWORD PTR 112[rsp]
	mov	QWORD PTR 120[rsp], rsi
	mov	BYTE PTR [rdi+rsi], 0
	mov	rdi, r15
.LEHB19:
	call	_Z10gnu_headerNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE19:
	mov	rdi, QWORD PTR 112[rsp]
	cmp	rdi, QWORD PTR 8[rsp]
	je	.L578
	call	_ZdlPv@PLT
.L578:
	lea	r8, 40[rsp]
	mov	QWORD PTR 24[rsp], r8
	lea	r13, 36[rsp]
	lea	rbx, .L583[rip]
	.p2align 4,,10
	.p2align 3
.L615:
	mov	r8, r13
	lea	rcx, _ZZ4mainE12long_options[rip]
	lea	rdx, .LC47[rip]
	mov	rsi, rbp
	mov	edi, r12d
	mov	DWORD PTR 36[rsp], 0
	call	getopt_long@PLT
	cmp	eax, -1
	je	.L579
	test	eax, eax
	je	.L580
	sub	eax, 97
	cmp	eax, 25
	ja	.L581
	movsx	r8, DWORD PTR [rbx+rax*4]
	add	r8, rbx
	notrack jmp	r8
	.section	.rodata
	.align 4
	.align 4
.L583:
	.long	.L592-.L583
	.long	.L581-.L583
	.long	.L591-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L590-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L589-.L583
	.long	.L588-.L583
	.long	.L587-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L586-.L583
	.long	.L585-.L583
	.long	.L581-.L583
	.long	.L584-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L581-.L583
	.long	.L582-.L583
	.section	.text.startup
	.p2align 4,,10
	.p2align 3
.L582:
	mov	rdi, QWORD PTR optarg[rip]
	mov	edx, 10
	xor	esi, esi
	call	strtol@PLT
	mov	DWORD PTR zillions[rip], eax
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L584:
	mov	BYTE PTR verbose_flag[rip], 1
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L585:
	mov	BYTE PTR test_flag[rip], 1
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L586:
	mov	rdi, QWORD PTR optarg[rip]
	mov	edx, 10
	xor	esi, esi
	call	strtol@PLT
	mov	DWORD PTR size[rip], eax
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L587:
	mov	r14, QWORD PTR optarg[rip]
	mov	rdi, r14
	call	strlen@PLT
	mov	rdx, QWORD PTR _Z14select_by_nameB5cxx11[rip+8]
	mov	r8, rax
	mov	rcx, r14
	xor	esi, esi
	lea	rdi, _Z14select_by_nameB5cxx11[rip]
.LEHB20:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm@PLT
.LEHE20:
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L588:
	mov	rdi, QWORD PTR optarg[rip]
	mov	edx, 10
	xor	esi, esi
	call	strtol@PLT
	mov	DWORD PTR method_id[rip], eax
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L591:
	mov	r10, QWORD PTR 80[rsp]
	mov	r14, QWORD PTR 88[rsp]
	mov	r9, QWORD PTR 8[rsp]
	mov	r11, r10
	add	r11, r14
	mov	QWORD PTR 112[rsp], r9
	mov	QWORD PTR 16[rsp], r10
	je	.L601
	test	r10, r10
	je	.L698
.L601:
	mov	QWORD PTR 40[rsp], r14
	cmp	r14, 15
	ja	.L699
	cmp	r14, 1
	jne	.L604
	mov	rcx, QWORD PTR 16[rsp]
	mov	rdx, QWORD PTR 8[rsp]
	movzx	esi, BYTE PTR [rcx]
	mov	BYTE PTR 128[rsp], sil
.L605:
	mov	QWORD PTR 120[rsp], r14
	mov	BYTE PTR [rdx+r14], 0
	mov	rdi, r15
.LEHB21:
	call	_Z7gnu_gplNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE21:
.L693:
	mov	rdi, QWORD PTR 112[rsp]
	cmp	rdi, QWORD PTR 8[rsp]
	je	.L615
	call	_ZdlPv@PLT
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L592:
	mov	rdi, QWORD PTR 8[rsp]
	mov	r14, QWORD PTR optarg[rip]
	mov	QWORD PTR 112[rsp], rdi
	test	r14, r14
	je	.L608
	mov	rdi, r14
	call	strlen@PLT
	mov	QWORD PTR 16[rsp], rax
	mov	QWORD PTR 40[rsp], rax
	cmp	rax, 15
	ja	.L700
	cmp	rax, 1
	jne	.L612
	movzx	r10d, BYTE PTR [r14]
	mov	r9, QWORD PTR 8[rsp]
	mov	BYTE PTR 128[rsp], r10b
.L613:
	mov	QWORD PTR 120[rsp], rax
	mov	BYTE PTR [r9+rax], 0
	mov	edx, 44
	mov	rsi, r15
	lea	rdi, test_avoid[rip]
.LEHB22:
	call	_Z8tokenizeRSt3setIjSt4lessIjESaIjEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEc
.LEHE22:
	jmp	.L693
.L576:
	lea	r15, 112[rsp]
	test	r13, r13
	je	.L577
	mov	rdi, QWORD PTR 8[rsp]
	jmp	.L575
	.p2align 4,,10
	.p2align 3
.L580:
	mov	edx, 7
	lea	rsi, .LC48[rip]
	lea	rdi, _ZSt4cerr[rip]
.LEHB23:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsx	r9, DWORD PTR 36[rsp]
	lea	r10, _ZZ4mainE12long_options[rip]
	sal	r9, 5
	mov	r14, QWORD PTR [r10+r9]
	test	r14, r14
	je	.L701
	mov	rdi, r14
	call	strlen@PLT
	mov	rdx, rax
	mov	rsi, r14
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L594:
	cmp	QWORD PTR optarg[rip], 0
	je	.L691
	mov	edx, 10
	lea	rsi, .LC49[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	r14, QWORD PTR optarg[rip]
	test	r14, r14
	je	.L702
	mov	rdi, r14
	call	strlen@PLT
	mov	rdx, rax
	mov	rsi, r14
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L691:
	lea	r14, _ZSt4cerr[rip]
.L595:
	mov	rdx, QWORD PTR [r14]
	mov	rcx, QWORD PTR -24[rdx]
	mov	r14, QWORD PTR 240[r14+rcx]
	test	r14, r14
	je	.L703
	cmp	BYTE PTR 56[r14], 0
	je	.L598
	movsx	esi, BYTE PTR 67[r14]
.L599:
	lea	rdi, _ZSt4cerr[rip]
	call	_ZNSo3putEc@PLT
	mov	rdi, rax
	call	_ZNSo5flushEv@PLT
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L598:
	mov	rdi, r14
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rsi, QWORD PTR [r14]
	lea	rdi, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rax, QWORD PTR 48[rsi]
	mov	esi, 10
	cmp	rax, rdi
	je	.L599
	mov	rdi, r14
	call	rax
	movsx	esi, al
	jmp	.L599
	.p2align 4,,10
	.p2align 3
.L604:
	test	r14, r14
	jne	.L704
	mov	rdx, QWORD PTR 8[rsp]
	jmp	.L605
	.p2align 4,,10
	.p2align 3
.L612:
	cmp	QWORD PTR 16[rsp], 0
	jne	.L705
	mov	r9, QWORD PTR 8[rsp]
	jmp	.L613
	.p2align 4,,10
	.p2align 3
.L699:
	mov	rsi, QWORD PTR 24[rsp]
	xor	edx, edx
	mov	rdi, r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	r8, QWORD PTR 40[rsp]
	mov	QWORD PTR 112[rsp], rax
	mov	QWORD PTR 128[rsp], r8
	mov	rdi, rax
.L603:
	mov	rsi, QWORD PTR 16[rsp]
	mov	rdx, r14
	call	memcpy@PLT
	mov	r14, QWORD PTR 40[rsp]
	mov	rdx, QWORD PTR 112[rsp]
	jmp	.L605
	.p2align 4,,10
	.p2align 3
.L700:
	mov	rsi, QWORD PTR 24[rsp]
	xor	edx, edx
	mov	rdi, r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	r11, QWORD PTR 40[rsp]
	mov	QWORD PTR 112[rsp], rax
	mov	QWORD PTR 128[rsp], r11
	mov	rdi, rax
.L611:
	mov	rdx, QWORD PTR 16[rsp]
	mov	rsi, r14
	call	memcpy@PLT
	mov	rax, QWORD PTR 40[rsp]
	mov	r9, QWORD PTR 112[rsp]
	jmp	.L613
	.p2align 4,,10
	.p2align 3
.L701:
	mov	r11, QWORD PTR _ZSt4cerr[rip]
	lea	rdi, _ZSt4cerr[rip]
	add	rdi, QWORD PTR -24[r11]
	mov	esi, DWORD PTR 32[rdi]
	or	esi, 1
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	jmp	.L594
	.p2align 4,,10
	.p2align 3
.L579:
	mov	r12d, DWORD PTR method_id[rip]
	test	r12d, r12d
	je	.L616
	cmp	QWORD PTR methods[rip+16], 0
	je	.L616
	lea	rbp, methods[rip+32]
	mov	r13d, 1
	.p2align 4,,10
	.p2align 3
.L617:
	add	rbp, 16
	mov	ebx, r13d
	inc	r13d
	cmp	QWORD PTR -16[rbp], 0
	jne	.L617
	cmp	r12d, ebx
	ja	.L616
	mov	eax, DWORD PTR zillions[rip]
	test	eax, eax
	jne	.L621
	mov	DWORD PTR zillions[rip], 1
.L621:
	call	_Z15report_compilerv
	call	_Z18allocate_resourcesv
	cmp	QWORD PTR _Z14select_by_nameB5cxx11[rip+8], 0
	je	.L624
	cmp	QWORD PTR methods[rip+16], 0
	je	.L628
	lea	r14, methods[rip+24]
	mov	ebp, 1
	lea	r12, _Z14select_by_nameB5cxx11[rip]
	jmp	.L627
	.p2align 4,,10
	.p2align 3
.L706:
	add	r14, 16
	inc	ebp
	cmp	QWORD PTR -8[r14], 0
	je	.L628
.L627:
	mov	rsi, QWORD PTR [r14]
	mov	rdi, r12
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc@PLT
	test	eax, eax
	jne	.L706
	mov	ecx, ebp
	sal	rcx, 4
	lea	rdx, methods[rip]
	cmp	QWORD PTR [rdx+rcx], 0
	je	.L628
	mov	DWORD PTR method_id[rip], ebp
.L624:
	vpxor	xmm0, xmm0, xmm0
	mov	edx, 5
	lea	rsi, .LC54[rip]
	lea	rdi, _ZSt4cout[rip]
	mov	QWORD PTR 64[rsp], 0
	vmovdqa	XMMWORD PTR 48[rsp], xmm0
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR size[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	cmp	BYTE PTR test_flag[rip], 0
	jne	.L707
	mov	rdi, r15
	call	_ZN8CPUTimerC1Ev@PLT
	mov	rdi, r15
	call	_ZN8CPUTimer5startEv@PLT
	mov	esi, DWORD PTR zillions[rip]
	xor	r13d, r13d
	lea	rbx, methods[rip]
	lea	r14, 48[rsp]
	test	esi, esi
	je	.L633
	.p2align 4,,10
	.p2align 3
.L631:
	mov	r8d, DWORD PTR method_id[rip]
	mov	QWORD PTR 64[rsp], 0
	vpxor	xmm1, xmm1, xmm1
	mov	esi, DWORD PTR size[rip]
	mov	rdi, QWORD PTR str[rip]
	vmovdqa	XMMWORD PTR 48[rsp], xmm1
	sal	r8, 4
	mov	rdx, r14
	call	[QWORD PTR [rbx+r8]]
	inc	r13d
	cmp	DWORD PTR zillions[rip], r13d
	ja	.L631
.L633:
	mov	rdi, r15
	call	_ZN8CPUTimer4stopEv@PLT
	mov	edx, 7
	lea	rsi, .LC55[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rsi, _ZSt4cout[rip]
	mov	rdi, r15
	call	_ZN8CPUTimer5printERSo@PLT
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	edx, 12
	lea	rsi, .LC56[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	r15d, DWORD PTR method_id[rip]
	lea	rdi, methods[rip]
	sal	r15, 4
	mov	rsi, QWORD PTR 8[rdi+r15]
	lea	rdi, _ZSt4cout[rip]
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	edx, 13
	lea	rsi, .LC57[rip]
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR 48[rsp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	lea	r13, 48[rsp]
	lea	rbp, 68[rsp]
	lea	r12, .LC5[rip]
.L634:
	mov	edx, 1
	mov	rsi, r12
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR 4[r13]
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	add	r13, 4
	cmp	rbp, r13
	jne	.L634
	lea	rdi, _ZSt4cout[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	mov	rdi, QWORD PTR str[rip]
	call	free@PLT
	mov	rdi, QWORD PTR 80[rsp]
	lea	r9, 96[rsp]
	cmp	rdi, r9
	je	.L635
	call	_ZdlPv@PLT
.L635:
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L708
	add	rsp, 168
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	xor	eax, eax
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L702:
	.cfi_restore_state
	mov	rax, QWORD PTR _ZSt4cerr[rip]
	lea	r14, _ZSt4cerr[rip]
	mov	rdi, QWORD PTR -24[rax]
	add	rdi, r14
	mov	esi, DWORD PTR 32[rdi]
	or	esi, 1
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate@PLT
	jmp	.L595
.L697:
	lea	r15, 112[rsp]
	lea	rsi, 40[rsp]
	xor	edx, edx
	mov	rdi, r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	mov	rbx, QWORD PTR 40[rsp]
	mov	QWORD PTR 112[rsp], rax
	mov	QWORD PTR 128[rsp], rbx
	mov	rdi, rax
.L575:
	mov	rdx, r13
	mov	rsi, r14
	call	memcpy@PLT
	jmp	.L577
.L581:
	mov	edx, 38
	lea	rsi, .LC50[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.L623:
	mov	edi, 1
	call	exit@PLT
.L590:
	mov	rsi, QWORD PTR 0[rbp]
	mov	rdi, r15
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
.LEHE23:
	mov	rdi, r15
.LEHB24:
	call	_Z5usageNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE24:
.L589:
.LEHB25:
	call	_Z12list_methodsv
.L704:
	mov	rdi, QWORD PTR 8[rsp]
	jmp	.L603
.L705:
	mov	rdi, QWORD PTR 8[rsp]
	jmp	.L611
.L616:
	mov	edx, 28
	lea	rsi, .LC51[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	r10, methods[rip]
	mov	r11d, 1
	jmp	.L619
.L709:
	inc	r11d
.L619:
	add	r10, 16
	cmp	QWORD PTR [r10], 0
	jne	.L709
	lea	esi, -1[r11]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZNSo9_M_insertImEERSoT_@PLT
	mov	edx, 1
	lea	rsi, .LC52[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.L695
.L628:
	mov	edx, 28
	lea	rsi, .LC58[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdx, QWORD PTR _Z14select_by_nameB5cxx11[rip+8]
	mov	rsi, QWORD PTR _Z14select_by_nameB5cxx11[rip]
	lea	rdi, _ZSt4cerr[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	edx, 1
	lea	rsi, .LC53[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L695:
	mov	rdi, rbx
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	jmp	.L623
.L707:
	call	_Z13validity_testv
.L708:
	call	__stack_chk_fail@PLT
.L696:
	lea	rdi, .LC0[rip]
	call	_ZSt19__throw_logic_errorPKc@PLT
.L608:
	lea	rdi, .LC0[rip]
	call	_ZSt19__throw_logic_errorPKc@PLT
.L703:
	call	_ZSt16__throw_bad_castv@PLT
.L698:
	lea	rdi, .LC0[rip]
	call	_ZSt19__throw_logic_errorPKc@PLT
.LEHE25:
.L653:
	endbr64
	mov	r14, rax
	jmp	.L636
.L656:
	endbr64
	mov	r14, rax
	jmp	.L643
.L655:
	endbr64
	mov	r14, rax
	jmp	.L641
.L652:
	endbr64
	mov	r14, rax
	vzeroupper
	jmp	.L638
.L654:
	endbr64
	mov	r14, rax
	jmp	.L639
	.section	.gcc_except_table
.LLSDA3360:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3360-.LLSDACSB3360
.LLSDACSB3360:
	.uleb128 .LEHB18-.LFB3360
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB19-.LFB3360
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L653-.LFB3360
	.uleb128 0
	.uleb128 .LEHB20-.LFB3360
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L652-.LFB3360
	.uleb128 0
	.uleb128 .LEHB21-.LFB3360
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L655-.LFB3360
	.uleb128 0
	.uleb128 .LEHB22-.LFB3360
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L656-.LFB3360
	.uleb128 0
	.uleb128 .LEHB23-.LFB3360
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L652-.LFB3360
	.uleb128 0
	.uleb128 .LEHB24-.LFB3360
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L654-.LFB3360
	.uleb128 0
	.uleb128 .LEHB25-.LFB3360
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L652-.LFB3360
	.uleb128 0
.LLSDACSE3360:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3360
	.type	main.cold, @function
main.cold:
.LFSB3360:
.L636:
	.cfi_def_cfa_offset 224
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	mov	rdi, QWORD PTR 112[rsp]
	cmp	rdi, QWORD PTR 8[rsp]
	je	.L685
	vzeroupper
	call	_ZdlPv@PLT
.L638:
	mov	rdi, QWORD PTR 80[rsp]
	lea	rax, 96[rsp]
	cmp	rdi, rax
	je	.L645
	call	_ZdlPv@PLT
.L645:
	mov	rdi, r14
.LEHB26:
	call	_Unwind_Resume@PLT
.LEHE26:
.L643:
	mov	rdi, QWORD PTR 112[rsp]
	cmp	rdi, QWORD PTR 8[rsp]
	je	.L688
	vzeroupper
	call	_ZdlPv@PLT
	jmp	.L638
.L688:
	vzeroupper
	jmp	.L638
.L641:
	mov	rdi, QWORD PTR 112[rsp]
	cmp	rdi, QWORD PTR 8[rsp]
	je	.L687
	vzeroupper
	call	_ZdlPv@PLT
	jmp	.L638
.L639:
	mov	rdi, QWORD PTR 112[rsp]
	cmp	rdi, QWORD PTR 8[rsp]
	je	.L686
	vzeroupper
	call	_ZdlPv@PLT
	jmp	.L638
.L687:
	vzeroupper
	jmp	.L638
.L685:
	vzeroupper
	jmp	.L638
.L686:
	vzeroupper
	jmp	.L638
	.cfi_endproc
.LFE3360:
	.section	.gcc_except_table
.LLSDAC3360:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3360-.LLSDACSBC3360
.LLSDACSBC3360:
	.uleb128 .LEHB26-.LCOLDB59
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
.LLSDACSEC3360:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE59:
	.section	.text.startup
.LHOTE59:
	.p2align 4
	.type	_GLOBAL__sub_I__Z15report_compilerv, @function
_GLOBAL__sub_I__Z15report_compilerv:
.LFB3940:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rdi, _ZStL8__ioinit[rip]
	call	_ZNSt8ios_base4InitC1Ev@PLT
	mov	rdi, QWORD PTR _ZNSt8ios_base4InitD1Ev@GOTPCREL[rip]
	lea	rdx, __dso_handle[rip]
	lea	rsi, _ZStL8__ioinit[rip]
	call	__cxa_atexit@PLT
	lea	rax, test_avoid[rip+8]
	lea	rdx, __dso_handle[rip]
	lea	rsi, -8[rax]
	lea	rdi, _ZNSt3setIjSt4lessIjESaIjEED1Ev[rip]
	mov	DWORD PTR test_avoid[rip+8], 0
	mov	QWORD PTR test_avoid[rip+16], 0
	mov	QWORD PTR test_avoid[rip+24], rax
	mov	QWORD PTR test_avoid[rip+32], rax
	mov	QWORD PTR test_avoid[rip+40], 0
	call	__cxa_atexit@PLT
	lea	rsi, .LC43[rip]
	lea	rdi, _Z14select_by_nameB5cxx11[rip]
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.constprop.0
	mov	rdi, QWORD PTR _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@GOTPCREL[rip]
	lea	rdx, __dso_handle[rip]
	lea	rsi, _Z14select_by_nameB5cxx11[rip]
	add	rsp, 8
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE3940:
	.size	_GLOBAL__sub_I__Z15report_compilerv, .-_GLOBAL__sub_I__Z15report_compilerv
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z15report_compilerv
	.section	.rodata.str1.1
.LC60:
	.string	"help"
.LC61:
	.string	"copying"
.LC62:
	.string	"list"
.LC63:
	.string	"method"
.LC64:
	.string	"method-name"
.LC65:
	.string	"size"
.LC66:
	.string	"avoid"
.LC67:
	.string	"verbose"
.LC68:
	.string	"zillions"
	.section	.data.rel.local,"aw"
	.align 32
	.type	_ZZ4mainE12long_options, @object
	.size	_ZZ4mainE12long_options, 352
_ZZ4mainE12long_options:
	.quad	.LC60
	.long	0
	.zero	4
	.quad	0
	.long	104
	.zero	4
	.quad	.LC61
	.long	0
	.zero	4
	.quad	0
	.long	99
	.zero	4
	.quad	.LC62
	.long	0
	.zero	4
	.quad	0
	.long	108
	.zero	4
	.quad	.LC63
	.long	1
	.zero	4
	.quad	0
	.long	109
	.zero	4
	.quad	.LC64
	.long	1
	.zero	4
	.quad	0
	.long	110
	.zero	4
	.quad	.LC65
	.long	1
	.zero	4
	.quad	0
	.long	115
	.zero	4
	.quad	.LC3
	.long	0
	.zero	4
	.quad	0
	.long	116
	.zero	4
	.quad	.LC66
	.long	1
	.zero	4
	.quad	0
	.long	97
	.zero	4
	.quad	.LC67
	.long	0
	.zero	4
	.quad	0
	.long	118
	.zero	4
	.quad	.LC68
	.long	1
	.zero	4
	.quad	0
	.long	122
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.globl	methods
	.section	.rodata.str1.1
.LC69:
	.string	"not defined"
.LC70:
	.string	"cv_if"
.LC71:
	.string	"cv_switch"
.LC72:
	.string	"cv_letters"
.LC73:
	.string	"cv_sse2_v1"
.LC74:
	.string	"cv_sse2_v2"
.LC75:
	.string	"cv_avx"
.LC76:
	.string	"cv_avx2_v1"
.LC77:
	.string	"cv_avx2_v2"
.LC78:
	.string	"cv_avx2_v3"
.LC79:
	.string	"cv_avx2_u2_v1"
.LC80:
	.string	"cv_avx2_u2_v2"
.LC81:
	.string	"cv_avx2_v2_u4"
.LC82:
	.string	"cv_avx2_v2_u8"
.LC83:
	.string	"cv_avx2_intrinsics"
.LC84:
	.string	"cv_avx512_asm_v1"
.LC85:
	.string	"cv_avx512_asm_v2"
.LC86:
	.string	"cv_avx512_asm_v4"
.LC87:
	.string	"cv_avx512_asm_v5"
.LC88:
	.string	"cv_avx512_asm_v2_u8"
.LC89:
	.string	"cv_avx512_asm_v3_u8"
.LC90:
	.string	"cv_avx512_intrinsics_v1"
.LC91:
	.string	"cv_avx512_intrinsics_v2"
	.section	.data.rel,"aw"
	.align 32
	.type	methods, @object
	.size	methods, 384
methods:
	.quad	0
	.quad	.LC69
	.quad	_Z5cv_ifPhjPj
	.quad	.LC70
	.quad	_Z9cv_switchPhjPj
	.quad	.LC71
	.quad	_Z10cv_lettersPhjPj
	.quad	.LC72
	.quad	cv_sse2_v1
	.quad	.LC73
	.quad	cv_sse2_v2
	.quad	.LC74
	.quad	cv_avx
	.quad	.LC75
	.quad	cv_avx2_v1
	.quad	.LC76
	.quad	cv_avx2_v2
	.quad	.LC77
	.quad	cv_avx2_v3
	.quad	.LC78
	.quad	cv_avx2_u2_v1
	.quad	.LC79
	.quad	cv_avx2_u2_v2
	.quad	.LC80
	.quad	cv_avx2_v2_u4
	.quad	.LC81
	.quad	cv_avx2_v2_u8
	.quad	.LC82
	.quad	_Z18cv_avx2_intrinsicsPhjPj
	.quad	.LC83
	.quad	cv_avx512_asm_v1
	.quad	.LC84
	.quad	cv_avx512_asm_v2
	.quad	.LC85
	.quad	cv_avx512_asm_v4
	.quad	.LC86
	.quad	cv_avx512_asm_v5
	.quad	.LC87
	.quad	cv_avx512_asm_v2_u8
	.quad	.LC88
	.quad	cv_avx512_asm_v3_u8
	.quad	.LC89
	.quad	_Z23cv_avx512_intrinsics_v1PhjPj
	.quad	.LC90
	.quad	_Z23cv_avx512_intrinsics_v2PhjPj
	.quad	.LC91
	.quad	0
	.quad	.LC69
	.globl	verbose_flag
	.bss
	.type	verbose_flag, @object
	.size	verbose_flag, 1
verbose_flag:
	.zero	1
	.globl	_Z14select_by_nameB5cxx11
	.align 32
	.type	_Z14select_by_nameB5cxx11, @object
	.size	_Z14select_by_nameB5cxx11, 32
_Z14select_by_nameB5cxx11:
	.zero	32
	.globl	test_avoid
	.align 32
	.type	test_avoid, @object
	.size	test_avoid, 48
test_avoid:
	.zero	48
	.globl	test_flag
	.type	test_flag, @object
	.size	test_flag, 1
test_flag:
	.zero	1
	.globl	zillions
	.data
	.align 4
	.type	zillions, @object
	.size	zillions, 4
zillions:
	.long	10000
	.globl	method_id
	.align 4
	.type	method_id, @object
	.size	method_id, 4
method_id:
	.long	1
	.globl	size
	.align 4
	.type	size, @object
	.size	size, 4
size:
	.long	255999
	.globl	str
	.bss
	.align 8
	.type	str, @object
	.size	str, 8
str:
	.zero	8
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 10-20200411-0ubuntu1) 10.0.1 20200411 (experimental) [master revision bb87d5cc77d:75961caccb7:f883c46b4877f637e0fa5025b4d6b5c9040ec566]"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
