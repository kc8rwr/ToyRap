use <common.scad>

$fn=360;

module z_bracket(left = false){
  mirror([(left)?1:0, 0, 0]){
    difference(){
      union(){
        cube([16.5, 22, 12]);
        cube([9, 22, 19.5]);
        translate([16.5, 11, 0]) cylinder(h=22, d=9);
        translate([0, 6.5, 0]) cube([16.5, 9, 22]);
	   }
  	   translate([16.5, 11, -1]) cylinder(d=shaft(), h=24);
	   translate([4.5, 11, -1]) cylinder(d=shaft(), h=24);
      translate([-1, 3, 3.5]) rotate([0, 90, 0]) cylinder(d=shaft(), h=22);
	   translate([-1, 19, 3.5]) rotate([0, 90, 0]) cylinder(d=shaft(), h=22);
      translate([8.25, 3, 3.5]) cylinder(d=screw_diameter(), h=22);
      translate([8.25, 19, 3.5]) cylinder(d=screw_diameter(), h=22);
      translate([8.25, 3, 6]) cylinder(d=nut_width(), h=nut_thickness(), $fn=6);
      translate([8.25 - (nut_width()/2), -1, 6]) cube([nut_width(), (nut_width()/2)+1, nut_thickness()]);
      translate([8.25, 19, 6]) cylinder(d=nut_width(), h=nut_thickness(), $fn=6);
      translate([8.25 - (nut_width()/2), 22-(nut_width()/2), 6]) cube([nut_width(), (nut_width()/2)+1, nut_thickness()]);
      translate([4.5, 8.5, 15]){
        rotate([270, 0, 0]) translate([0, 0, -9])cylinder(d=screw_diameter(), h=12);
	     translate([-5, -nut_thickness(), -nut_width()/2]) cube([5, nut_thickness(), nut_width()]);
	     rotate([90, 0, 0]) cylinder(d=nut_width(), h=nut_thickness(), $fn=6);
		}
	 }
  }
}


module right_z_bracket(supports=false){
  z_bracket();
  translate([16.5, 7, 0]){
    rotate([90, 0, 0]){
      difference(){
        union(){
			translate([21.6, 15.1, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
			translate([10.6, 4.1, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
			translate([21.6, 4.1, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
			translate([10.6, 15.1, 1.5]) scale([0.33, 0.33, 0.33]) hex_cap();
     	    linear_extrude(height = 2){
            hull(){
              translate([0, 18, 0]) square(1);
              translate([25, 18, 0]) circle(d=2);
              translate([25, 1, 0]) circle(d=2);
              square(4);
				}
			 }
		  }
        translate([16.1, 9.6, -2]) cylinder(d=7.5, h=5);
        translate([5, 2, -0.5]){
          linear_extrude(height=1){
            hull(){
              translate([4, 0.5, 0]) circle(d=1);
              translate([18.2, 0.5, 0]) circle(d=1);
              translate([4, 14.7, 0]) circle(d=1);
              translate([18.2, 14.7, 0]) circle(d=1);
		      }
	       }
        }
	   }
	 }
  }
  translate([22, 5.8, 0]) cube([18, 4, 0.5]);
  if (supports){
	translate([8.05, 0, 0]) cube([0.2, 22, 12]);
  }
}

module left_z_bracket(supports = false){
  z_bracket(true);
  translate([-16.5, 7, 0]){
    rotate([90, 0, 0]){
      difference(){
     	  linear_extrude(height = 2){
          hull(){
            translate([0, 14, 0]) square(1);
            translate([-17, 14, 0]) circle(d=2);
            translate([-17, 1, 0]) circle(d=2);
            square(1);
  		    }
		  }
        translate([-10.5, 7.5, -2]) cylinder(d=screw_diameter(), h=5);
        translate([-10.5, 7.5, -1]) cylinder(d=nut_width(), h=2, $fn=6);	  
	   }
	 }
	}
   translate([-33, 5.8, 0]) cube([11, 4, 0.5]);
   if (supports){
	  translate([-8.05, 0, 0]) cube([0.2, 22, 12]);
  }
}

translate([-1, 0, 0]) left_z_bracket(false);
translate([1, 0, 0]) right_z_bracket(false);

