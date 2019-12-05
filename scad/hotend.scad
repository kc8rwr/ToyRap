use <common.scad>

$fn = 360;

translate([5, 5, 0]) cylinder(d=10, h=21);
translate([5, 0, 0])cube([10, 10, 10]);
translate([11, -0.5, 5]) rotate([270, 0, 0]) cylinder(d=4, h=11);