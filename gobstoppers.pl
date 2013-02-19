use warnings;
use strict;
use Data::Dumper;

# $$board[row][column]
# 7 x 7
my $board = [
    [qw(ps rr gb gc yp ys rp yb)],
    [qw(gs rp pr pc gr pp rs bp)],
    [qw(pp pc rc rp rs gr bs yb)],
    [qw(yr yr yb ps pc gc rc gp)],
    [qw(rp gc bs pp yc yb rb br)],
    [qw(rb bp yr ys bp rc pb yp)],
    [qw(gc rr gr yc yp yc yr rs)],
    [qw(gr bp bc br bs bc pb gp)],
];

#print is_valid_neighbor($$board[0][0], $$board[1][1]), "\n";

print Dumper( get_valid_neighbors(0,7) );


sub get_valid_neighbors {
    my ($row,$column) = @_;
    my $allNeighbors = get_all_neighbors($row, $column);

    return $allNeighbors;
}

sub get_all_neighbors {
    my ($row,$column) = @_;
    my $total_rows    = scalar @$board;
    my $total_columns = scalar(@{$$board[0]});

    my $neighbors = [];

    # top
    push(@$neighbors, [$row - 1, $column])
        if $row > 0;

    # left
    push(@$neighbors, [$row, $column - 1])
        if $column > 0;

    # bottom
    push(@$neighbors, [$row + 1, $column])
        if $row < $total_rows - 1;

    # right
    push(@$neighbors, [$row, $column + 1])
        if $column < $total_columns - 1;

    # diagonal neighbors
    ####################

    # upper left
    push(@$neighbors, [$row - 1, $column - 1])
        if $row > 0 && $column > 0;

    # lower left
    push(@$neighbors, [$row + 1, $column - 1])
        if $row < $total_rows - 1 && $column > 0;

    # lower right
    push(@$neighbors, [$row + 1, $column + 1])
        if $row < $total_rows - 1 && $column < $total_columns - 1;

    # upper right
    push(@$neighbors, [$row - 1, $column + 1])
        if $row > 0 && $column < $total_columns - 1;

    return $neighbors;

}

# each point is string from the board - not a (row,column)
sub is_valid_neighbor {
    my ($point_one, $point_two) = @_;

    my ($p1k1, $p1k2) = split('', $point_one);
    my ($p2k1, $p2k2) = split('', $point_two);

    return $p1k1 eq $p2k1 ||
        $p1k2 eq $p2k2;
}

__END__

Key:

First character:
y:yellow
b:blue
r:red
p:purple
g:green

Second character:
r:ring
b:ball
c:cube
p:plus
s:spring