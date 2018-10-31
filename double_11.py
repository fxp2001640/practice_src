#!/usr/bin/env python

import sys

class Double_11:
	def __init__(self):
		self.xitems = []

	def parse_item_in_line(self, line):
		li = line.split()
		self.xitems.append({'name':li[0], 'price':float(li[1])})

	def load_items(self, path):
		f=open(path, 'r')
		with open(path, 'r') as f:
			for line in f:
				self.parse_item_in_line(line)

	def show_items(self):
		total=0
		print("name = price")
		print("------------")
		for it in self.xitems:
			print("{name} = {price}".format(name=it['name'], price=it['price']))
			total += it['price']
		print("------------")
		print("total={ft}".format(ft=total))

x11 = Double_11()
x11.load_items(sys.argv[1])
x11.show_items()
