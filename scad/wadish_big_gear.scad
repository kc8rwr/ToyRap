use <common.scad>

$fn = 360;

module wadish_big_gear(num_teeth = 40, gear_diameter = 26, part_thickness = 2, hex_head = false){
  gear_circ = PI * gear_diameter;
  tooth_circ = gear_circ / num_teeth;
  tooth_deg = 360 / num_teeth;
  tooth_side = (gear_diameter*(sin(tooth_deg/2)));

  difference(){
    union(){
      cylinder(d=gear_diameter, h=part_thickness);
      cylinder(d=(2*part_thickness) + m3_cap_diameter(), h=3*part_thickness);
    }
    translate([0, 0, (3*part_thickness)-m3_cap_height()]) cylinder(d=m3_cap_diameter(), h=1+m3_cap_height(), $fn=(hex_head)?6:$fn);
    translate([0, 0, -1]){
      linear_extrude(height=part_thickness + 2){
	for (a=[0:tooth_deg:360]){
	  rotate([0, 0, a]){
	    translate([0, -gear_diameter/2, 0]){
	      polygon(points=[[0, -1], [0, 0], [tooth_side/2, tooth_side], [tooth_side, 0], [tooth_side, -1]]);
	    }
	  }
	}
      }
      cylinder(d=screw_diameter(), h=2+(3*part_thickness));
    }
  }
}

wadish_big_gear(hex_head=false);
