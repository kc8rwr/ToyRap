use <common.scad>

$fn=360;

height=9;
spacer_height=1;
rim_height=1;
outer_diameter=9;
inner_diameter=6;

module pully_half(){
  h=(height/2)-spacer_height;
  difference(){
    union(){
      cylinder(h=h, d=inner_diameter);
      cylinder(h=rim_height, d=outer_diameter);
    }
    translate([0, 0, -1]) cylinder(d=screw_diameter(), h=h+2);
  }
}

module spacer(){
  difference(){
    cylinder(d=inner_diameter, h=spacer_height);
    translate([0, 0, -1]) cylinder(d=screw_diameter(), h=spacer_height+2);
  }
}

pully_half();