use <common.scad>

$fn=360;

part_thickness = 2;

//plate
difference(){
  //main outline
  linear_extrude(height = part_thickness){
    difference(){
      hull(){
        translate([1, 1, 0]) circle(d=2);
        translate([70, 1, 0]) circle(d=2);
        translate([1, 70, 0]) circle(d=2);
        translate([70, 70, 0]) circle(d=2);
      }
    }
  }

  translate([0, 0, part_thickness - 0.25]){
    //power pads
    translate([15, 67, 0]){
      cube([20, 3, 0.5]);
      translate([4, 1.5, -part_thickness]){
	cylinder(d=2, h=part_thickness+0.5);
      }
      translate([15, 1.5, -part_thickness]){
	cylinder(d=2, h=part_thickness+0.5);
      }
    }
    translate([43, 67, 0]){
      cube([10, 3, 0.5]);
      translate([5, 1.5, -part_thickness]){
	cylinder(d=2, h=part_thickness+0.5);
      }
    }
    //heater grid
    translate([2, 10, 0]) cube([3, 50, 0.5]);
    translate([66, 10, 0]) cube([3, 51, 0.5]);
    for (y=[10:2:60]){
      translate([2, y, 0]) cube([66, 1, 0.5]);
    }
  }
  
  
  //heatbed_screws
  translate([0, 0, -1]){
    translate([4, 4, 0]) cylinder(h=part_thickness+2, d=screw_diameter());
    translate([67, 4, 0]) cylinder(h=part_thickness+2, d=screw_diameter());
    translate([4, 67, 0]) cylinder(h=part_thickness+2, d=screw_diameter());
    translate([67, 67, 0]) cylinder(h=part_thickness+2, d=screw_diameter());
  }
}


