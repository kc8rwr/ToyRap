$fn=365;

use <common.scad>

module captive_shaft(){
  translate([0, (nut_width() / 2), 7]){
    rotate([0, 90, 0]){
      cylinder(d=screw_diameter(), h=15, $fn=33);
	   translate([0, 0, 8]){
	     rotate([0, 0, 30]){
		    cylinder(d=nut_width(), h=nut_thickness(), $fn=6);
  		  }
	   }
    }
  }
  translate([8, 0, -1]){
    cube([nut_thickness(), nut_width(), 8]);
  }

  translate([14, nut_width()/2, 4]){
    cylinder(d=shaft(), h=15, $fn=45);
  }
}

module main_bracket(){
  difference(){
    union(){
      linear_extrude(height=2){
        hull(){
          translate([0, 21, 0])square([15, 1]);
          translate([1, 1, 0]) circle(r=1);
          translate([14, 1, 0]) circle(r=1);
        }
      }
      translate([0, 21, 11]){
        rotate([270, 0, 0]){
          linear_extrude(height=2){
            hull(){
              translate([0, 10, 0])square([15, 1]);
              translate([1, 1, 0]) circle(r=1);
              translate([14, 1, 0]) circle(r=1);
            }
          }
        }
      }
      translate([1, 16, 0]) rotate([90, 0, 90]) linear_extrude(height=2) polygon([[0, 0], [5, 0], [5, 10]]);
      translate([12, 16, 0]) rotate([90, 0, 90]) linear_extrude(height=2) polygon([[0, 0], [5, 0], [5, 10]]);
      translate([1.83, 1.83, 0]) hex_cap();
      translate([13.17, 1.83, 0]) hex_cap();
      translate([13.17, 13.17, 0]) hex_cap();
      translate([1.83, 13.17, 0]) hex_cap();
    }
    translate([7.5, 7, -1]) cylinder(d=8, h=4);
    translate([7.5, 20, 7]) rotate([270, 90, 0]) cylinder(d=3.5, h=5); 
  }
}

module z_smooth_clamp(){
  difference(){
    linear_extrude(height=9.5){
      hull(){
        square([1, 10]);
        translate([11, 1, 0]) circle(r=1);
        translate([11, 9, 0]) circle(r=1);
      }
    }
    translate([18, 8.6, -2.25]) rotate([0, 0, 180]) captive_shaft();
  }
  translate([-5, 3, 0]) rotate([90, 0, 0]) linear_extrude(height=2) polygon([[0, 0], [5, 9.5], [5, 0]]);
  translate([-5, 9, 0]) rotate([90, 0, 0]) linear_extrude(height=2) polygon([[0, 0], [5, 9.5], [5, 0]]);

}

module z_motor_bracket(isLeft = false){
  difference(){
    union(){
      main_bracket();
      if (isLeft){
	     translate([15, 2.2, 0]) z_smooth_clamp();
		}
		else
		{
        translate([0, 12.5, 0]) rotate([0, 0, 180]) z_smooth_clamp();
		}
    }
    translate([7.5, 7, -1]) cylinder(d=8, h=4);
  }
}

translate([-30, 0, 0]) z_motor_bracket(isLeft =true);
translate([15, 0, 0]) z_motor_bracket(isLeft = false);