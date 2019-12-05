use <common.scad>

$fn=360;

module extruder_carriage(support = false){
  difference(){
    union(){
      translate([34, 0, 7]) {
        rotate([270, 180, 0]){
          difference(){
	    union(){
              linear_extrude(height=2){
		hull(){
                  square(1);
                  translate([1, 17, 0]) circle(d=2);
                  translate([33, 17, 0]) circle(d=2);
                  translate([33, 0, 0]) square(1);
		}
	      }
  	      linear_extrude(height=15){
                hull(){
                  translate([18, 0, 0]) square(1);
                  translate([19, 17, 0]) circle(d=2);
                  translate([33, 17, 0]) circle(d=2);
                  translate([33, 0, 0]) square(1);
    		}
	      }
	    }
            translate([2, 2, 1.5]) cube([14, 14, 1]);
            translate([9, 9, -1]) cylinder(h=4, d=7.5);
            translate([25, 9, -1]) cylinder(h=24, d=screw_diameter());
          }
          translate([3.5, 3.5, 0]) rotate([180, 0, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
          translate([14.5, 3.5, 0]) rotate([180, 0, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
          translate([3.5, 14.5, 0]) rotate([180, 0, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
          translate([14.5, 14.5, 0]) rotate([180, 0, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
	}
      }
      cube([34, 22, 7]);
    }
    translate([-1, 3, 3.5]) rotate([0, 90, 0]) cylinder(d=shaft(), h=36);
    translate([-1, 19, 3.5]) rotate([0, 90, 0]) cylinder(d=shaft(), h=36);
    translate([9, 11, -1]) cylinder(d=10.5, h=5); //hotend mounting hole
    translate([9, 11, 18]) cylinder(d=1.5, h=402); //filament path
  }
  if (support){
    for(pos = [7.1:3:16]){
      translate([0, pos, 0]) cube([14, 0.3, 4]);
      translate([pos, 6, 0]) cube([0.3, 10, 4]);
    }
    translate([9, 11, 0]) cylinder(d=9, h=1);
  }
}

extruder_carriage(true);

