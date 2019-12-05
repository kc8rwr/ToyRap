use <common.scad>

frame_separation = 109;
frame_thickness = 5;
part_thickness = frame_thickness;
spool_depth = 30;

$fn=360;

module left_bracket(){
  linear_extrude(height=part_thickness){
    polygon(points=[
	//outline
	[part_thickness+frame_thickness, 0], //bottom left
	[part_thickness+frame_thickness, (frame_separation/3)-part_thickness], //hook inside right
	[part_thickness, (frame_separation/3)-part_thickness], //hook inside left
	[part_thickness, (frame_separation/3)-((3*part_thickness)+frame_thickness)], //hook inside bottom
	[0, (frame_separation/3)-((3*part_thickness)+frame_thickness)], //hook outside bottom
	[0, (frame_separation/3)], //top left
	[(2*part_thickness)+frame_thickness, frame_separation/3], //hook outside right
	[(2*part_thickness)+frame_thickness+(frame_separation/3), 0], //bottom right      
	//cutout
	[(2*part_thickness)+frame_thickness, part_thickness], //bottom left
	[(2*part_thickness)+frame_thickness, (frame_separation/3)-part_thickness], //top left
	[frame_thickness+(frame_separation/3), part_thickness] //bottom right
      ],
      paths=[
	[0, 1, 2, 3, 4, 5, 6, 7], [8, 9, 10]
      ]
    );
  }
  translate([0, (frame_separation/3)-((3*part_thickness)+frame_thickness), 0]) {
    difference(){
      cube([part_thickness, 9, 9+part_thickness]);
      translate([-1, 4.5, part_thickness+4.5]) rotate([0, 90, 0]) cylinder(d=screw_diameter(), h=part_thickness+2);
    }
  }
}

module right_bracket(){
  translate ([(2*part_thickness)+frame_thickness+(frame_separation/3), 0, 0]) mirror() left_bracket();
}

module spool_n_brackets(with_middle = true, filament_texture = true){
  left_bracket();
  translate([frame_thickness+(frame_separation*2/3), 0, 0]) right_bracket();
  translate([part_thickness+frame_thickness+(frame_separation/2), frame_separation/3, 0]){
    difference(){
      union(){
	cylinder(d=frame_separation*2/3, h=part_thickness);
	if (with_middle){
	  if (filament_texture){
	    for(z=[0:1:spool_depth-(2*part_thickness)]){
	      translate([0, 0, z+part_thickness]) cylinder(d=((0==z%2)?(frame_separation/3)-1:frame_separation/3), h=1);
	    }
	  } else {
	    cylinder(d=frame_separation/3, h=spool_depth-part_thickness);
	  }
	}
      }
      translate([0, 0, -1]) cylinder(d=frame_separation/6, h=frame_separation);
    }
  }
}

spool_n_brackets(with_middle=true);