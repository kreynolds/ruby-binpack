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
    12.times do
      items << Binpack::Item.new((rand(10)+2)/2.0, (rand(10)+2)/2.0)
    end

    # Pack the array of items into a bin where the default bin size is 16x10 with a padding of 1
    bins = Binpack::Bin.pack(items, [], Bin.new(16, 10, 1))

    puts bins.join("\n\n")
  
Visual output

    fff_ddddd_22_88_
    fff_ddddd_22_88_
    fff_ddddd_22_88_
    fff_______22_88_
    fff_fffff____88_
    ____fffff_______
    1__________99___
    1_22_5_c_8______
    1_22_5_c_8_9____
    1____5_c_8______

