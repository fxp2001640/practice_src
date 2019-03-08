#!/usr/bin/env python

import sys
import random
import yaml
import commands
import re
import math

class SudokuUtility:
    def idx_str_to_int(self, idx_str):
        idx_str_array = [['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i'],
                         ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'],
                         ['1', '2', '3', '4', '5', '6', '7', '8', '9']]
        for a in idx_str_array:
            idx = 0
            for b in a:
                if idx_str == b:
                    return idx
                idx += 1
        return 'NA'

    def check_duplication_in_list(self, r_start, r_end, c_start, c_end):
        #Init
        vs = [0] * 10
        #Collect
        for r in range(r_start, r_end):
            for c in range(c_start, c_end):
                vs[self.table[r * 9 + c]] += 1
        #Check
        for idx in range(1, 10):
            if vs[idx] > 1:
                return True
        # There is no error
        return False

    def check_candidate_missmatch(self, r_start, r_end, c_start, c_end):
        #Init
        vs = [0] * 9
        num_of_candidate = 0
        num_of_empty = 0
        #Collect
        for r in range(r_start, r_end):
            for c in range(c_start, c_end):
                if self.table[r * 9 + c] == 0:
                    num_of_empty += 1
                    self.candidate[r * 9 + c].num_of_candidate(vs)
        #Collect number of candidate
        for idx in range(0, 9):
            if not vs[idx] == 0: num_of_candidate += 1
        #return true if missmatch
        #return not num_of_empty == num_of_candidate
        if self.debug:
            print("num_of_empty={ex},num_of_candidate={cx}".format(ex=num_of_empty, cx=num_of_candidate))
        return False

class CandidateNumber:
    def __init__(self):
        self.suppress_cnt = [0] * 9

    def set_candidate(self, candidate):
        if candidate == 0:
            self.suppress_cnt = [0] * 9
        else:
            self.suppress_cnt[candidate - 1] = 0
            for idx in range(0, 9):
                if not idx == (candidate - 1):
                    self.suppress_cnt[idx] += 1

    def add_candidate(self, new_candidate, recover):
        #Skip if argument is invalid
        if new_candidate == 0:
            return
        #Process
        if recover:
            if self.suppress_cnt[new_candidate - 1] > 0:
                self.suppress_cnt[new_candidate - 1] -= 1
        else:
            self.suppress_cnt[new_candidate - 1] = 0

    def remove_candidate(self, old_candidate):
        if not old_candidate == 0:
            self.suppress_cnt[old_candidate - 1] += 1

    def rollback_as_candidate(self, old_value):
        for idx in range(0, 9):
            if not idx == (old_value - 1):
                self.suppress_cnt[idx] -= 1

    def get_candidate(self):
        for idx in range(0, 9):
            if self.suppress_cnt[idx] == 0:
                return idx + 1
        return 0

    def get_candidate_list(self):
        output_str = "{ "
        for idx in range(0, 9):
            if self.suppress_cnt[idx] == 0:
                output_str = output_str + "{x} ".format(x = (idx + 1))
        output_str = output_str + "}"
        return output_str

    def get_random_candidate(self):
        candidate_cnt = self.num_of_candidate()
        if candidate_cnt == 0: return 0
        selected_idx = random.randrange(0, candidate_cnt)
        cnt = 0
        for idx in range(0, 9):
            if self.suppress_cnt[idx] == 0:
                if cnt == selected_idx:
                    return idx +1
                cnt += 1

    def num_of_candidate(self, to_fill = 'NA'):
        cnt = 0
        for idx in range(0, 9):
            if self.suppress_cnt[idx] == 0:
                cnt += 1
                if not to_fill == 'NA': to_fill[idx] += 1
        return cnt

class SudokuTable(SudokuUtility):
    def __init__(self, path = 'NA', parent = 'NA', debug = False):
        self.table = [0] * 81
        self.candidate = [0] * 81
        self.debug = debug
        for idx in range(0, 81):
            self.candidate[idx] = CandidateNumber()
        if not path == 'NA':
            self.load_from_file(path)
        if not parent == 'NA':
            self.clone_from(parent)

    def get_life_value(self):
        life_value = 0
        for idx in range(0, 81):
            life_value += self.candidate[idx].num_of_candidate()
        return life_value

    def table_is_in_wrong_state(self):
        #Check every row
        for r in range(0, 9):
            if self.check_duplication_in_list(r, r+1, 0, 9):
                return True
            if self.check_candidate_missmatch(r, r+1, 0, 9):
                return True
        #Check every column
        for c in range(0, 9):
            if self.check_duplication_in_list(0, 9, c, c+1):
                return True
            if self.check_candidate_missmatch(0, 9, c, c+1):
                return True
        #Check every 9-block
        for r in range(0, 9, 3):
            for c in range(0, 9, 3):
                if self.check_duplication_in_list(r, r+3, c, c+3):
                    return True
                if self.check_candidate_missmatch(r, r+3, c, c+3):
                    return True
        for idx in range(0, 81):
            if self.table[idx] == 0 and self.candidate[idx].num_of_candidate() == 0:
                return True
        #There is no error
        return False

    def load_from_file(self, path):
        with open(path, 'r') as f:
            for line in f:
                m = re.match(r'\W*\(([a-i]|[A-I]|[1-9]),\W*([a-i]|[A-I]|[1-9])\) = ([1-9])\W*', line)
                if not m: continue
                #Add item into table
                row = self.idx_str_to_int(m.group(1))
                column = self.idx_str_to_int(m.group(2))
                value = 1 + self.idx_str_to_int(m.group(3))
                self.set_item(row, column, value)

    def clone_from(self, parent):
        for idx in range(0, 81):
            if not parent.table[idx] == 0:
                self.set_item((idx / 9), (idx % 9), parent.table[idx])

    def make_mutation(self):
        zero_cnt = 0
        for idx in range(0, 81):
            if self.table[idx] == 0:
                zero_cnt += 1
        if zero_cnt == 0: return
        #make change
        idx_to_switch = random.randrange(0, zero_cnt)
        zero_cnt = 0
        for idx in range(0, 81):
            if self.table[idx] == 0:
                if zero_cnt == idx_to_switch:
                    switch_to_value = self.candidate[idx].get_random_candidate()
                    self.set_item((idx / 9), (idx % 9), switch_to_value)
                    break
                zero_cnt += 1

    def evolution(self):
        changed = 0
        for idx in range(0, 81):
            if self.table[idx] == 0 and self.candidate[idx].num_of_candidate() == 1:
                self.set_item((idx/9), (idx%9), self.candidate[idx].get_candidate())
                changed += 1
        if not changed == 0:
            return self.evolution()

    def recover_candidate(self, r, c, v):
        self.table[r * 9 + c] = 0
        self.candidate[r * 9 + c].rollback_as_candidate(v)
        for idx in range(0, 9):
            if not idx == c:
                self.candidate[r * 9 + idx].add_candidate(v, True)
        for idx in range(0, 9):
            if not idx == r:
                self.candidate[idx * 9 + c].add_candidate(v, True)
        n_start = r / 3
        m_start = c / 3
        for n in range(0, 3):
            for m in range(0, 3):
                if (not n == (r % 3)) or (not m == (c % 3)):
                    self.candidate[((n_start * 3) + n) * 9 + ((m_start * 3) + m)].add_candidate(v, True)

    def set_item(self, r, c, v):
        original_v = self.table[r * 9 + c]
        if not original_v == 0:
            self.recover_candidate(r, c, v)
        #update candidate in the same row/column/cube
        self.table[r * 9 + c] = v
        self.candidate[r * 9 + c].set_candidate(v)
        for idx in range(0, 9):
            if not idx == c:
                self.candidate[r * 9 + idx].remove_candidate(v)
        for idx in range(0, 9):
            if not idx == r:
                self.candidate[idx * 9 + c].remove_candidate(v)
        n_start = r / 3
        m_start = c / 3
        for n in range(0, 3):
            for m in range(0, 3):
                if (not n == (r % 3)) or (not m == (c % 3)):
                    self.candidate[((n_start * 3) + n) * 9 + ((m_start * 3) + m)].remove_candidate(v)
        #propagate change
        self.evolution()
        if self.debug: self.dump()

    def dump(self):
        print("*****1***2***3*|*4***5***6*|*7***8***9**")
        print("---------------|-----------|------------")
        for r in range(0, 9):
            #print("{nr}**| {n0} | {n1} | {n2} | {n3} | {n4} | {n5} | {n6} | {n7} | {n8} |".format(nr=(r+1), n0=self.table[r * 9 + 0], n1=self.table[r * 9 + 1], n2=self.table[r * 9 + 2],
            #                                                              n3=self.table[r * 9 + 3], n4=self.table[r * 9 + 4], n5=self.table[r * 9 + 5],
            #                                                              n6=self.table[r * 9 + 6], n7=self.table[r * 9 + 7], n8=self.table[r * 9 + 8]))
            line_str = "{nr}**| n0 | n1 | n2 | n3 | n4 | n5 | n6 | n7 | n8 |".format(nr = (r+1))
            for c in range(0, 9):
                if self.table[r * 9 + c] == 0:
                    line_str = line_str.replace("n{n}".format(n=c), " ")
                else:
                    line_str = line_str.replace("n{n}".format(n=c), "{v}".format(v=self.table[r * 9 + c]))
            print(line_str)
            if (r % 3) == 2:
                print("===============|===========|============")
            else:
                print("---------------|-----------|------------")
        #idx = 0
        #for it in self.table:
        #    print("<{r},{c}>={v}".format(r=(1 + idx/9), c=(1 + idx%9), v=it))
        #    idx += 1
        for idx in range(0, 81):
            if self.table[idx] == 0:
                print("<{r},{c}>={v}".format(r=((idx/9)+1), c=((idx%9)+1), v=bin(self.candidate[idx].num)))

class SudokuEvolution:
    def __init__(self, question_path):
        self.current = []
        self.current.append(SudokuTable(path=question_path))
        self.current_limit = 240
        self.population_size = 40

    #child_a :    xxx(zone A)xxx yyy(zone B)yyy zzz(zone C)zzz
    #child_b :    xxx(zone A)xxx yyy(zone B)yyy zzz(zone C)zzz
    #zone A: both child a and b have the same value in this zone
    #zone B: both child a and b have different value in this zone
    #zone C: all values in this zone are zero
    def generate_children(self, parent_a, parent_b):
        child_a = SudokuTable(parent = parent_a)
        child_b = SudokuTable(parent = parent_b)
        diff_cnt = 0
        for idx in range(0, 81):
            if (not child_a.table[idx] == child_b.table[idx]) and (not child_a.table[idx] == 0) and (not child_b.table[idx] == 0):
                diff_cnt += 1
        #switch one value in zone B
        if diff_cnt > 0:
            idx_to_switch = random.randrange(0, diff_cnt)
            diff_cnt = 0
            for idx in range(0, 81):
                if (not child_a.table[idx] == child_b.table[idx]) and (not child_a.table[idx] == 0) and (not child_b.table[idx] == 0):
                    if diff_cnt == idx_to_switch:
                        tmp = child_a.table[idx]
                        child_a.set_item((idx / 9), (idx % 9), child_b.table[idx])
                        child_b.set_item((idx / 9), (idx % 9), tmp)
                        break
                    diff_cnt += 1
        #Replace a zero value to a specific value
        child_a.make_mutation()
        child_b.make_mutation()
        #Add children into current population
        if len(self.current) < self.current_limit:
            self.current.append(child_a)
        if len(self.current) < self.current_limit:
            self.current.append(child_b)

    def grow_population(self):
        current_len = len(self.current)
        if current_len == 1:
            self.current[0].evolution()
            second = SudokuTable(parent = self.current[0])
            second.make_mutation()
            self.current.append(second)
        #generate more children
        current_len = len(self.current)
        while len(self.current) < self.current_limit:
            a = random.randrange(0, current_len)
            b = random.randrange(0, current_len)
            #print(len(self.current), a, b)
            if not a == b:
                self.generate_children(self.current[a], self.current[b])

    def get_wrong_child(self):
        for idx in range(0, len(self.current)):
            if self.current[idx].table_is_in_wrong_state():
                return idx
        return 'NA'

    def select_child(self):
        #delete all wrong children
        while True:
            wrong_child = self.get_wrong_child()
            if wrong_child == 'NA':
                break
            else:
                del self.current[wrong_child]
                #print("del wrong child {idx}".format(idx = wrong_child))
        #sort children by their life value
        self.current.sort(key=lambda it: it.get_life_value())
        #select the first self.population_size children
        for idx in range(len(self.current)-1, -1, -1):
            if idx >= self.population_size:
                del self.current[idx]

    def renew(self, first):
        for idx in range(len(self.current)-1, -1, -1):
            del self.current[idx]
        self.current.append(first)

    def evolution(self, total_generations = 10000):
        first = self.current[0]
        gen_cnt = 0
        while gen_cnt < total_generations:
            lowest_life_value = self.current[0].get_life_value()
            print("round : {num}, lowest life : {life}".format(num = gen_cnt, life = lowest_life_value))
            if lowest_life_value == 81: break
            self.grow_population()
            self.select_child()
            gen_cnt += 1
            if (gen_cnt % 10 == 0): self.renew(first)

    def dump(self):
        idx = 0
        for it in self.current:
            lv = it.get_life_value()
            if lv <= 81:
                print("**============{n}={l}============**".format(n=idx, l=lv))
                it.dump()
                break
            elif idx <= 3:
                print("**============{n}={l}============**".format(n=idx, l=lv))
                it.dump()
            idx += 1

def single_test():
    sd = SudokuTable(debug = True)
    sd.load_from_file(sys.argv[1])
    print(sd.table_is_in_wrong_state())
    print(sd.get_life_value())
    sd.dump()
    sd.make_mutation()
    print(sd.table_is_in_wrong_state())
    print(sd.get_life_value())
    sd.dump()

if len(sys.argv) == 3:
    single_test()
    #se = SudokuEvolution(sys.argv[1])
    #se.evolution(int(sys.argv[2]))
    #se.dump()
else:
    print("Help: python sudoku.py <question file> <round num>")
