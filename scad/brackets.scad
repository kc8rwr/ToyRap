use <common.scad>

$fn=360;

height = m3_cap_diameter() + m3_cap_height() + 6;
width = m3_cap_diameter() + 6.5;

difference(){
  union(){
    cube([2, height, width]);
    cube([height, 2, width]);
    linear_extrude(height=2) polygon(points=[[0, 0], [0, height], [height, 0], [0, 0]]);
  }
  translate([height/2, -1, width/2]) rotate([270, 0, 0]) cylinder(d=screw_diameter(), h=4);
  translate([3, height/2, width/2]) rotate([0, 270, 0]) cylinder(d=screw_diameter(), h=4);
}
