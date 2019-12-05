use <common.scad>

$fn = 360;

module fan(screw_holes = false){

  difference(){
    union(){
      linear_extrude(height = 6){
	hull(){
	  translate([1, 1, 0]) circle(d=2);
	  translate([29, 1, 0]) circle(d=2);
	  translate([29, 29, 0]) circle (d = 2);
	  translate([1, 29, 0]) circle (d=2);
	}
      }
      if (!screw_holes){
	translate([2.5, 2.5, 4]) hex_cap();
	translate([27.5, 2.5, 4]) hex_cap();
	translate([27.5, 27.5, 4]) hex_cap();
	translate([2.5, 27.5, 4]) hex_cap();
      }
    }
    translate([15, 15, 5])cylinder(d = 28, h=2);
    if (screw_holes){
      translate([2.5, 2.5, -1])cylinder(d = screw_diameter(), h=8);
      translate([27.5, 2.5, -1])cylinder(d = screw_diameter(), h=8);
      translate([27.5, 27.5, -1])cylinder(d = screw_diameter(), h=8);
      translate([2.5, 27.5, -1])cylinder(d = screw_diameter(), h=8);
    }
  }
}

fan(true);