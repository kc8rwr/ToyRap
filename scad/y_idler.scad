use <common.scad>

$fn=360;

module web(){
  translate([2, 22, 0]){
    rotate([90, 0, -90]){
      linear_extrude(height = 2){
        hull(){
          translate(1, 1, 0) square(2);
          translate([10, 13, 0]) circle(d=2);
          translate([20, 13, 0]) circle(d=2);
          translate([20, 0, 0]) square(2);
        }
      }
    }
  }
}

module y_idler(screw_holes = false){
  difference(){
    union(){
      cube([14, 22, 2]);
      web();
      translate([12, 0, 0]) web();
      if (!screw_holes){
	translate([7, 13, 0]) hex_cap();
      }
    }
    if (screw_holes){
      translate([7, 13, -1]) cylinder(d=screw_diameter(), h=4);
    }
    translate([-1, 7, 10]) rotate([0, 90, 0]) cylinder(d=screw_diameter(), h=24);
  }
}

y_idler();
