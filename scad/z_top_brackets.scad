use <common.scad>

$fn=60;

//shaft centers 15mm from frame
//shaft centers 12mm apart

module z_top_bracket(){
  difference(){
    union(){
      //main body
      translate([9, 0, 0]){
	linear_extrude(height=11){
          hull(){
            translate([1, 1, 0]) circle(d=2);
            translate([21.5, 1, 0]) circle(d=2);
            translate([0, 24, 0]) square([22, 1]);
          }
	}
      }
      
      // screw hole flange
      translate([0, 23, 0]) cube([40, 2, 11]);

      //support web
      translate([9, 0, 0]){
	linear_extrude(height=2){
          hull(){
            translate([1, 1, 0]) circle(d=2);
            translate([21.5, 1, 0]) circle(d=2);
            translate([-9, 24, 0]) square([40, 1]);
          }
	}
      }
    }
    
    translate([4.5, 26, 6.5]) rotate([90, 0, 0]) cylinder(d=screw_diameter(), h=4); //mounting screw right (seen left as printed upside down)
    translate([35.5, 26, 6.5]) rotate([90, 0, 0]) cylinder(d=screw_diameter(), h=4);//mounting screw left (seen right as printed upside down)
    translate([14, 10, -1]) cylinder (d=shaft(), h=13); //shaft right (seen left as printed upside down)
    translate([26, 10, -1]) cylinder (d=shaft(), h=13); //shaft left (seen right as printed upside down)
    translate([14, 0, 6.5]) rotate([90, 0, 0]) translate([0, 0, -10]) cylinder(d=screw_diameter(), h=11); //grub screw hole right (seen left as printed upside down)
    translate([26, 0, 6.5]) rotate([90, 0, 0]) translate([0, 0, -10]) cylinder(d=screw_diameter(), h=11); //grub screw hole left (seen right as printed upside down)
    translate([14, 7, 6.5]) rotate([90, 0, 0]) cylinder($fn=6, h=nut_thickness(), d=nut_width()); //nut trap right (seen left as printed upside down)
    translate([14 - (nut_width()/2), 7-nut_thickness(), 6.5]) cube([nut_width(), nut_thickness(), 7.5]); //nut insert path right (seen left as printed upside down
    translate([26, 7, 6.5]) rotate([90, 0, 0]) cylinder($fn=6, h=nut_thickness(), d=nut_width()); //nut trap left (seen right as printed upside down)
    translate([26 - (nut_width()/2), 7-nut_thickness(), 6.5]) cube([nut_width(), nut_thickness(), 7.5]); //nut insert path left (seen right as printed upside down
  }
}

z_top_bracket();