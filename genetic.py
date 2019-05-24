#!/usr/bin/python
###############################################################################
# Filename    : genetic.py 
# Created     : April 27, 2016
# Author      : Forrest
'''
Description   :
This program will use the genetic algorithm to change a random string of letters
into whatever is given in the fitness function. You must also put the amount of
letters in the creature function. This would not be possible without the help
from:
http://lethain.com/
http://www.electricmonk.nl/
'''
# Modified    :
###############################################################################

import  numpy as np
import numpy as np
import random
import string
from random import randint
import matplotlib.pyplot as mpl

def creature(length=12):
    '''Returns a creature in the population.
    
    This creates a random string of letters length long.
    
    '''
    creature = list(''.join([random.choice(
                             string.ascii_lowercase) for n in range(length)]))
    return creature

def fitness(creature, final='optimization'):
    '''Returns a fitness value.
    
    Calculates the fitness of the characters. Zero is perfect fitness.

    '''
    sums = np.array([])
    n = len(final)
    for i in range(n):
        a_i = abs(ord(creature[i]) - ord(final[i]))
        sums = np.append(sums,a_i)
        total = np.sum(sums)
    return total

def population(amount):
    '''Returns a population of creatures.
    
    Creates a list of creatures.

    '''
    popul = []
    for i in range(amount):
        creature_i = creature()
        popul.append(creature_i)
    return popul

def pop_average(pop):
    '''Returns average fitness of population.
    
    Averages the fitness of the given population.
    
    '''
    n = len(pop)
    aver = []
    for i in range(n):
        pop_i = fitness(pop[i])
        aver.append(pop_i)
    average = np.mean(aver)
    return average

def evolve(pop, survive=0.2, mutation=3):
    '''Returns an evolved population.
    
    1. Randomly mutates the parents DNA, with random letters.
    2. Orders the parents by fitness level.
    3. Culls 'survive' of the population.
    4. Breeds the parents to create children.
    
    '''
    m = len(pop[0])
    n = len(pop)
    par_length = len(pop[0])
    pop_length = len(pop)
    
    order = []
    # Mutation
    for i in range(mutation):
        which_parents = random.sample(range(0,len(pop)), mutation)
        letter_index = random.sample(range(0,m), mutation)
        pop[which_parents[i]][letter_index[i]] = ''.join([random.choice(
                                                 string.ascii_lowercase)])
    for i in range(n):
        pop_i = fitness(pop[i])
        order.append(pop_i)
    index = sorted(range(len(order)), key=order.__getitem__)
    parents = [pop[index[0]], pop[index[1]]]
    survival = int(len(order) * survive)
    
    if survival & 1:
        survival += 1
    not_dead = random.sample(range(2,n), survival)
    
    for i in range(survival):
        parents.append(pop[not_dead[i]])

    # Breeding
    parents_amount = len(parents)
    desired = len(pop) - parents_amount
    children = []
    while len(children) < desired:
        male = randint(0, parents_amount-1)
        female = randint(0, parents_amount-1)
        if male != female:
            male = parents[male]
            female = parents[female]
            half = int(len(male) / 2)
            child = male[:half] + female[half:]
            children.append(child)
            
    parents.extend(children)
    
    return parents

# This is an example use:
# p = population(100)
# fitness_history0 = [pop_average(p),]
# while True:
#     p = evolve(p)
#     if pop_average(p) < 1:
#         print(''.join(p[0]))
#         break
#     top_creature = ''.join(p[0])
#     print("Population Average: {}\n Top Creature: {}".format(pop_average(p), 
#                                                              top_creature))
#     fitness_history0.append(pop_average(p))