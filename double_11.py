#!/usr/bin/env python

import sys
import random

class Long_bits:
    def __init__(self, blen, init_value = []):
        self.to_delete = False
        init_value_len = len(init_value)
        if (init_value_len != 0) and (init_value_len != blen):
            print("init value doesn't equal to input length")
            self.bits_len = 0
            self.bits = []
            return

        self.bits_len = blen
        if init_value_len:
            self.bits = init_value.copy()
            return

        self.bits = [0]*blen
        xint = random.getrandbits(blen)
        for idx in range(0, blen):
            if xint & (1 << idx) :
                self.bits[idx] = 1

    def price(self, items):
        total = 0
        idx = 0
        for b in self.bits:
            total += b * items[idx]['price']
            idx += 1
        return total

    def generate_child(self):
        copied_bits = self.bits.copy()
        for n in range(0, 3):
            idx = random.randrange(0, self.bits_len)
            copied_bits[idx] = random.randrange(0, 2)
        return Long_bits(self.bits_len, copied_bits)

    def mark_to_del(self):
        self.to_delete = True

    def show(self, items):
        total = 0.0
        print("{p:.1f}".format(p=self.price(items)), " = ", end="")
        for idx in range(0, self.bits_len):
            if self.bits[idx]:
                print(idx+1, "({p}) ".format(p=items[idx]['price']), end="")
                total = total + items[idx]['price']
        print(" = {p:.1f}".format(p=total))

class Double_11:
    def __init__(self):
        self.xitems = []
        self.current = []
        self.expected_num_of_result = 10
        self.children_per_generation = 0

    def parse_item_in_line(self, line):
        li = line.split()
        self.xitems.append({'name': li[0], 'price': float(li[1])})

    def load_items_from_file(self, path):
        with open(path, 'r') as f:
            for line in f:
                self.parse_item_in_line(line)

        #self.children_per_generation = int(len(self.xitems) / 2)
        self.children_per_generation = 10

    def generate_children(self, children_num):
        parent_num = len(self.current)
        for idx in range(0, parent_num):
            for n in range(0, children_num):
                self.current.append(self.current[idx].generate_child())

    def select_child(self, expected_sum):
        #sort children by its distance to expected summary
        self.current.sort(key=lambda it: (it.price(self.xitems) - expected_sum) if (it.price(self.xitems) - expected_sum) >= 0 else 100000000)
        #select first 'self.expected_num_of_result' children, mark others as dead
        selected = 0
        for it in self.current:
            if (it.price(self.xitems) < expected_sum) or (selected >= self.expected_num_of_result):
                it.mark_to_del()
            else:
                selected = selected + 1
        #delete children who have been marked as dead
        for idx in range(len(self.current)-1, -1, -1):
            if self.current[idx].to_delete:
                del self.current[idx]

    def evolution(self, expected_sum, log=False):
        if self.children_per_generation == 0:
            print("No items, skip")
            return

        for idx in range(0, 100):
            #create initial children randomly
            if len(self.current) == 0:
                for x in range(0, self.expected_num_of_result):
                    self.current.append(Long_bits(len(self.xitems)))
            #generate next generation randomly
            self.generate_children(self.children_per_generation)
            #show children
            if log:
                for it in self.current:
                    it.show(self.xitems)
                print("---------")
            #select children according to their distance to expected sumary
            self.select_child(expected_sum)

    def show_evolution_result(self):
        for it in self.current:
            it.show(self.xitems)

    def show_items(self):
        total = 0
        print("name = price")
        print("------------")
        for it in self.xitems:
            print("{name} = {price}".format(name=it['name'], price=it['price']))
            total += it['price']
        print("------------")
        print("total={ft}".format(ft=total))


x11 = Double_11()
x11.load_items_from_file(sys.argv[1])
x11.evolution(600)
x11.show_evolution_result()