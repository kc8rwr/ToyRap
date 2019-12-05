use <common.scad>

$fn=360;

module y_motor_bracket(screw_holes = false){
  translate([0, 2, 0]){
    rotate([90, 0, 0]){
      difference(){
	union(){
          linear_extrude(height=2){
            hull(){
              square(1);
              translate([19, 0, 0]) square(1);
              translate([1, 13, 0]) circle(d=2);
              translate([19, 13, 0]) circle(d=2);
            }
          }
          translate([4.5, 1.25, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
          translate([15.5, 1.25, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
          translate([15.5, 12.25, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
          translate([4.5, 12.25, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
	}
	translate([10, 6.75, -1])cylinder(h=4, d=7.5);
      }
    }
  }

  translate([18, 0, 0]) {
    rotate([0, 90, 0]){
      linear_extrude(height=2){
	hull(){
          translate([-1, 0, 0]) square(1);
          translate([-2, 9, 0]) square(2);
          translate([-13, 1, 0]) circle(d=2);
	}
      }
    }
  }

  rotate([0, 90, 0]){
    linear_extrude(height=2){
      hull(){
        translate([-1, 0, 0]) square(1);
        translate([-2, 9, 0]) square(2);
        translate([-13, 1, 0]) circle(d=2);
      }
    }
  }

  difference(){
    union(){
      linear_extrude(height=2){
	hull(){
	  translate([-6, 1, 0]) circle(d=2);
	  translate([-6, 10, 0]) circle(d=2);
	  translate([-1, 0, 0]) square(1);
	  translate([-1, 10, 0]) square(1);
	}
      }
      if (!screw_holes){
	translate([-3.5, 5, 0]) hex_cap();
      }
    }
    if (screw_holes){
      translate([-3.5, 5, -1]) cylinder(d=screw_diameter(), h=4);
    }
  }

  translate([27, 0, 0]){
    difference(){
      union(){
	linear_extrude(height=2){
	  hull(){
            translate([-7, 0, 0]) square(1);
            translate([-7, 10, 0]) square(1);
            translate([-1, 1, 0]) circle(d=2);
            translate([-1, 10, 0]) circle(d=2);
	  }
	}
	if (!screw_holes){
	  translate([-3.5, 5, 0]) hex_cap();
	}
      }
      if (screw_holes){
	translate([-3.5, 5, -1]) cylinder(d=screw_diameter(), h=4);
      }
    }
  }
}

y_motor_bracket(screw_holes=false);