use <common.scad>

$fn=360;

module extruder_gear(){
  difference(){
    union(){
      linear_extrude(height=15){
        for (a=[0:360/11:360]){
          hull(){
            circle(d=2.25);
            rotate(a) translate([7.75, 0, 0]) circle(d=2.25, $fn=6);
          }
        }
        circle(d=13);
      }
      cylinder(d=18, h=7);
    }
    translate([0, 0, -1]) cylinder(d=5.3, h=17);
  }
}

module belt_gear(){
    difference(){
        union(){
            linear_extrude(height=21){
              for (a=[0:360/8:360]){
                hull(){
                  circle(d=2.25);
                  rotate(a) translate([5.25, 0, 0]) circle(d=2.25, $fn=6);
                }
              }
              circle(d=10);
            }
            cylinder(d=20, h=9);
        }
        translate([0, 0, -1]) cylinder(d=5.3, h=22);
    }
}

module coupler(){
  difference(){
    cylinder(d=20, h=30);
    translate([0, 0, 7.5]){
      linear_extrude(height=15, twist=4*360, slices=3000){
	translate([0, -10.1, 0]) rotate([0, 0, 0]) square([7, 2]);
      }
    }
    translate([0, 0, -1]) cylinder(d=shaft(), h=32);
  }
}

module xy_motor(shaft_length=25.6, texture_sides=true){
  nema_17(texture_sides=texture_sides, shaft_length=25.6);
  translate([21.1, 21.1, 38]) belt_gear();
}

module extruder_motor(shaft_length=20, texture_sides=true){
  nema_17(shaft_length=shaft_length, texture_sides=texture_sides);
  translate([21.1, 21.1, 38]) extruder_gear();
}

module z_motor(texture_sides=true){
  difference(){
    scale([1/3, 1/3, 1/3]){
      nema_17(texture_sides=texture_sides);
      translate([21.1, 21.1, 38]) coupler();
    }
    translate([7, 7, -1]) cylinder(d=shaft(), h=70);
    translate([3.5+(nut_width()/2), 2+nut_thickness(), 6]) rotate([90, 0, 0]) cylinder($fn=6, h=nut_thickness(), d=nut_width());
    translate([nut_width()/2, 2, -1]) cube([nut_width(), nut_thickness(), 4.5+(nut_width()/2)]);
    translate([3.5+nut_width()/2, -1, 6]) rotate([270, 0, 0]) cylinder(d=screw_diameter(), h=8);
  }
}

scale([1/3, 1/3, 1/3]) xy_motor();

//  translate([0, 0, 2.5+(nut_width()/2)]) rotate([90, 0, 0]) cylinder(d=screw_diameter(), 8);
//}