# Introduction
This is a gem adapted from a solution for 2-dimensional bin packing by Ilmari Heikkinen. From the post:

> It's a greedy heuristic algorithm that tries to fit each box into the trunk, largest first.
> If no box fits, a new trunk is created.
> I'm representing trunks as 2D tables of squares (with one unit of hidden padding around), then fill it starting from top left.
> The fitterfirst finds a row with enough empty space to fit the box and then checks if the next box-height rows also contain the space.
> If they do, the box is drawn to the rows.
> Printing is easy because the trunk already is in printable format.

## Usage
    # Create an array of random items
    items = []
    12.times do |i|
      items << Binpack::Item.new("Associated object #{i+1}", (rand(10)+2)/2.0, (rand(10)+2)/2.0)
    end

    # Pack the array of items into a bin where the default bin size is 16x10 with a padding of 1
    bins = Binpack::Bin.pack(items, [], Binpack::Bin.new(16, 10, 1))

  
Visual output example:

    puts bins.join("\n\n")

    22222_0000_11_cc
    22222_0000_11_cc
    22222_0000_11_cc
    ___________11_cc
    99_888_aaa____cc
    99_888__________
    99_____b_aaa____
    99_0_7_b________
    99_0_7_b_0______
    ___0_7___0______
    
Array of items, their locations locations, and whether or not they had to be rotated 90º

    puts bins[0].items.inspect
    
    [
      [#<Binpack::Item:0x007f84bb14c5c0 @obj="Associated object 12", @width=5.0, @height=3.0, @rotated=false>, 1, 1],
      [#<Binpack::Item:0x007f84bb031438 @obj="Associated object 1", @width=4.5, @height=3.0, @rotated=false>, 7, 1],
      [#<Binpack::Item:0x007f84bb14c6b0 @obj="Associated object 11", @width=2.5, @height=4.5, @rotated=false>, 12, 1],
      [#<Binpack::Item:0x007f84bb031000 @obj="Associated object 3", @width=2.0, @height=5.0, @rotated=false>, 15, 1],
      [#<Binpack::Item:0x007f84bb030dd0 @obj="Associated object 4", @width=2.0, @height=5.0, @rotated=false>, 1, 5],
      [#<Binpack::Item:0x007f84bb14c890 @obj="Associated object 9", @width=3.5, @height=2.5, @rotated=false>, 4, 5],
      [#<Binpack::Item:0x007f84bb14c980 @obj="Associated object 8", @width=3.5, @height=1.5, @rotated=false>, 8, 5],
      [#<Binpack::Item:0x007f84bb030b00 @obj="Associated object 5", @width=1.5, @height=3.0, @rotated=false>, 4, 8],
      [#<Binpack::Item:0x007f84bb0311e0 @obj="Associated object 2", @width=1.0, @height=4.0, @rotated=false>, 6, 8],
      [#<Binpack::Item:0x007f84bb14c7a0 @obj="Associated object 10", @width=1.0, @height=3.5, @rotated=false>, 8, 7],
      [#<Binpack::Item:0x007f84bb14cb60 @obj="Associated object 6", @width=3.5, @height=1.0, @rotated=false>, 10, 7],
      [#<Binpack::Item:0x007f84bb02a070 @obj="Associated object 7", @width=1.0, @height=2.5, @rotated=true>, 10, 9]
    ]
    
## Notes

1. The packing assumes a border of @padding. If you wish to put images on an 11"x17"
piece of paper with a 1" border, you will need to make the bin 16x10 with a padding of 1.
2. When layout out your objects, be sure to note whether or not the item had to be rotated to fit.
3. The algorithm uses string matching to determine placement so if higher precision than integral is required, you'll need to use a multiplier on everything.