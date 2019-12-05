use <common.scad>

$fn=360;
module rail (length = 12){
  translate([0, length, 0]){
    rotate([90, 0, 0]){
      linear_extrude(height = length){
        difference(){
          hull(){
            intersection(){
              translate([6, 6, 0]) circle (r=6);
      	     square([12, 12]);
            }
            square([12, 1]);
          }
          translate([6, 8, 0]) circle(d=shaft());
		  }
		}
    }
  }
}
 //over 5

  main_thickness = (nut_thickness()/2) + 2;

//plate
difference(){
  //main outline
  linear_extrude(height = main_thickness){
    difference(){
      hull(){
        translate([1, 1, 0]) circle(d=2);
        translate([70, 1, 0]) circle(d=2);
        translate([1, 70, 0]) circle(d=2);
        translate([70, 70, 0]) circle(d=2);
      }
      translate([29.5, -1, 0]) square([12, 6]);
    }
   }
   //captive nuts
	translate([0, 0, main_thickness - (nut_thickness()/2)]){
	  translate([4, 4, 0]) cylinder(h=nut_thickness(), d=nut_width(), $fn=6); 
	  translate([67, 4, 0]) cylinder(h=nut_thickness(), d=nut_width(), $fn=6); 
	  translate([4, 67, 0]) cylinder(h=nut_thickness(), d=nut_width(), $fn=6); 
	  translate([67, 67, 0]) cylinder(h=nut_thickness(), d=nut_width(), $fn=6); 
	}

   //heatbed_screws
	translate([0, 0, -1]){
	  translate([4, 4, 0]) cylinder(h=main_thickness+2, d=screw_diameter());
	  translate([67, 4, 0]) cylinder(h=main_thickness+2, d=screw_diameter());
	  translate([4, 67, 0]) cylinder(h=main_thickness+2, d=screw_diameter());
	  translate([67, 67, 0]) cylinder(h=main_thickness+2, d=screw_diameter());
	}
}

//rails
translate([7.5, 5, main_thickness]) rail(61);
translate([51.5, 29.5, main_thickness]) rail(12);
