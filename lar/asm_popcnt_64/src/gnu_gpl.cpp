#include "gnu_gpl.h"

const string ulc = u8"\xe2\x94\x8c";
const string urc = u8"\xe2\x94\x90";

const string blc = u8"\xe2\x94\x94";
const string brc = u8"\xe2\x94\x98";

const string hln = u8"\xe2\x94\x80";
const string vln = u8"\xe2\x94\x82";

vector<string> gpl_strings = { 
	"GNU GENERAL PUBLIC LICENSE", 
    "Version 3, 29 June 2007",
    " ",
	"ASM_POPCNT64 helps compare different implementations of the",
	"product of two square matrices",
    " ", 
    "Copyright (C) 2019  Jean-Michel RICHER", 
	" ", 
    "This program is free software: you can redistribute it and/or modify", 
    "it under the terms of the GNU General Public License as published by", 
    "the Free Software Foundation, either version 3 of the License, or", 
    "(at your option) any later version.", 
	" ", 
    "This program is distributed in the hope that it will be useful,", 
    "but WITHOUT ANY WARRANTY; without even the implied warranty of", 
    "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the", 
    "GNU General Public License for more details.",
    " ", 
    "You should have received a copy of the GNU General Public License", 
    "along with this program.  If not, see <https://www.gnu.org/licenses/>", 
    " ", 
	"Contact: jean-michel.richer@univ-angers.fr", 
	" ",
};

vector<string> header_strings = {
	"ASM_POPCNT64",
	"Copyright (C) 2019  Jean-Michel RICHER",
	"This program comes with ABSOLUTELY NO WARRANTY; for details type `-h'",
	"This is free software, and you are welcome to redistribute it",
	"under certain conditions; type `-c' for details."
};


void draw_hzln(int n) {
	for (int i=0; i<n; ++i) cout << hln;
}

void draw_uln() {
	cout << "    " << ulc;
	draw_hzln(70);
	cout << urc << endl;
}

void draw_bln() {
	cout << "    " << blc;
	draw_hzln(70);
	cout << brc << endl;
}

void print_center(string &s) {
	const size_t line_length = 70;
	size_t size_of_s = s.size();
	size_t padding_left = (line_length - size_of_s) / 2;
	size_t padding_right = line_length - padding_left - size_of_s;
	string l(padding_left, ' ');
	string r(padding_right, ' ');
	  
	cout << "    " << vln << l << s << r << vln << endl;
}

void gnu_header(string prog_name) {
	draw_uln();
	for (auto& s : header_strings) {
		print_center(s);
	}
	draw_bln();
	
}


void gnu_gpl(string prog_name) {
	draw_uln();
	for (auto& s : gpl_strings) {
		print_center(s);
	}
	draw_bln();
	exit(0);
}
