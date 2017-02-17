---
layout: post
title:  "Data Structures for Bootcamp Grads: The Linked List"
date:   2017-02-15 08:58:00 +0000
categories: cs data-structures
author: Michael Lennox (https://github.com/michaellennox)
contributors:
---

## What is a linked list

A linked list is a common data structure that can be used for implementing many different ADTs. Unlike an array which is an indexed list of elements that are contiguously loaded into memory, a linked list is a list of nodes each of which have a reference to the next node in the list.

The particular linked list we describe below is a singly-linked list.

A `Node` in a linked list has two attributes:
* an attribute such as `value` which contains the value of that node
* an attribute such as `next` which contains a reference to the next node in a list

## Example Implementation

To demonstrate how a linked list can be implemented we will assemble and manipulate a basic `Node` struct.

The `Node` is a simple `Struct` with two properties `value` and `next`.

~~~ ruby
Node = Struct.new(:value, :next)
~~~

We can now create a list by chaining together nodes.

~~~ ruby
list = Node.new('third element',
        Node.new('second element',
          Node.new('first element', nil)))
#=> #<struct Node value="third element",
#      next=#<struct Node value="second element",
#        next=#<struct Node value="first element", next=nil>>
~~~

Removing or adding a new node to the list is as simple as removing or adding a single reference

~~~ ruby
# adding a new node as the head of the list
longer_list = Node.new('fourth element', list)
#=> #<struct Node value="fourth element",
#      next=#<struct Node value="third element",
#        next=#<struct Node value="second element",
#          next=#<struct Node value="first element", next=nil>>>>

# removing the final element in the list
list.next.next = nil
list
#=> #<struct Node value="third element",
#     next=#<struct Node value="second element", next=nil>>

# note that by removing the final element of list we will also have removed
# the final element of longer_list as list was a subset of the longer_list
# with the same objects referenced
longer_list
#=> #<struct Node value="fourth element",
#      next=#<struct Node value="third element",
#        next=#<struct Node value="second element", next=nil>>>

~~~

## Why use a linked list?

A linked list is regularly used to implement common ADTs such as a `Stack`, `Queue` where modifying and/or reading the head or tail of the list happens often.

Because adding or removing an element to a linked list only requires a single operation to change the reference of one object in the list, it can be much more efficient than an array which can require a redraw of all indexes in the array upon modification. For smaller arrays this will be quite meaningless but for large arrays this can be quite expensive.

The major downside of a linked list compared to an array is that it is very expensive to carry out operations such as accessing an element by it's index as you are required to iterate through each node in the linked list to reach the requested index whereas with an array you can access the element directly via the index.
