#!/usr/bin/env python3
import random
import math

def random_angle() :
	a = math.pi
	return(random.uniform(a/2, a))

if __name__ == "__main__":
	random_angle()
