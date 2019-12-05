use <common.scad>

$fn=360;

module circle_foot(screw = false){
  difference(){
    linear_extrude(height=8, scale=0.8) circle(9);
    if (screw){
      translate([0, 0, -1]) cylinder(d=screw_diameter(), h=10);
      translate([0, 0, 8 - m3_cap_height()]) cylinder(d=m3_cap_diameter(), h=m3_cap_height()+1);
    }
  }
}

circle_foot(screw = false);
