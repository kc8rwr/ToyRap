use <common.scad>

$fn=360;

module y_rail_bracket(left = true){
  translate([(left)?0:30, 0, (left)?0:11]) rotate([0, (left)?0:180, 0])

  difference(){
    union(){
	
  	  //support webbing
      translate([0, 0, (left)?0:9]){ 
        linear_extrude(height=2) polygon(points=[[0, 0], [9.5, 9], [21, 9], [30, 0]]);
      }
	 
	 
      linear_extrude(height=11){
      
	    //base
	     square([30, 1]);
        translate([1, 1, 0]) circle(r=1);
        translate([29, 1, 0]) circle(r=1);
        //square([28, 1]);
        translate([1, 0]) square([28, 2]);
      
	     //main body
	     hull(){    
          translate([9, 0]){
            square([12, 4]);
            translate([6, 7]) circle(r=6);
            translate([11, 12]) circle(r=1);
          }
        }
      }
    }

    //holes
    translate([13.5, 8, -1]) cylinder(d=shaft(), h=13); //shaft
    translate([16.5, 8, 6]){
      rotate([0, 90, 0]) cylinder(d=nut_width(), h=nut_thickness(), $fn=6); // captive nut
      translate([0, (-nut_width()/2) + 0.5, (left)?-8:0]) cube([nut_thickness(), sqrt(3)/2*nut_width(), 8 ]); //   captive nut insertion path
      translate([-4, 0, 0]) rotate([0, 90, 0])  cylinder(d=screw_diameter(), h=12); // grub screw
    }
    translate([0, 0, (left)?0:-2]){
      translate([4.5, -1, 6.5]) rotate([270, 0, 0]) cylinder(d=screw_diameter(), h=4);
      translate([24.5, -1, 6.5]) rotate([270, 0, 0]) cylinder(d=screw_diameter(), h=4);
    }    
  }
 }

translate([2.5, 0, 0]) y_rail_bracket(false);
 translate([-32.5, 0, 0]) y_rail_bracket(true);