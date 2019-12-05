function shaft() = 3.77;
function nut_width() = 6.5;
function nut_thickness() = 3;
function screw_diameter() =3.25;
function m3_cap_diameter() = 5.5;
function m3_cap_height() = 3.5;

module hex_cap(){
  difference(){
    cylinder(d=3.66, h=3);
    translate([0, 0, 1.25]) cylinder(d=2, h=2, $fn=6);
  }
}

module inverse_hex_cap(){
  cylinder(d=3.66, h=0.5, $fn=360);
  cylinder(d=2, h=1, $fn=6);
}

module nema17_end(top=true, shaft_length=25.6){
  $fn=360;
  difference(){
	 union(){
      linear_extrude(height = 9){
        difference(){
          hull(){
            translate([2, 2, 0]) circle(r=2);
            translate([40.3, 2, 0]) circle(r=2);
            translate([40.3, 40.3, 0]) circle(r=2);
            translate([2, 40.3, 0]) circle(r=2);
	       }
          translate([5.65, 5.65, 0]) circle(d = screw_diameter());
          translate([36.65, 5.65, 0]) circle(d = screw_diameter());
          translate([5.65, 36.65, 0]) circle(d = screw_diameter());
          translate([36.65, 36.65, 0]) circle(d = screw_diameter());
	      }	
	    }
       if (top){
         translate([21.15, 21.15, 9]){
           difference(){
		       cylinder(d=22, h=2);
		       translate([0, 0, -0.5]) cylinder(d=6.5, h=3.5);
		     }
		     translate([0, 0, -0.6]) cylinder(d=5.5, h=shaft_length);
			}
		 }
	  }
	  if (!top){
		  translate([21.15, 21.15, -1]){
			  cylinder(d=7, h=3);
		  }
	  }
	}
}

module nema17_slice(wide=true, height=18){
  $fn=360;
  linear_extrude(height){
    difference(){
      hull(){
        translate([wide?1:2, wide?6.65:7.65, 0]) circle(r=1);
        translate([wide?6.65:7.65, wide?1:2, 0]) circle(r=1);
        translate([wide?37.65:36.65, wide?1:2, 0]) circle(r=1);
        translate([wide?41.3:40.3, wide?6.65:7.65, 0]) circle(r=1);
        translate([wide?41.3:40.3, wide?35.65:34.65, 0]) circle(r=1);
        translate([wide?35.65:34.65, wide?41.3:40.3, 0]) circle(r=1);
        translate([wide?6.65:7.65, wide?41.3:40.3, 0]) circle(r=1);
        translate([wide?1:2, wide?35.65:34.65, 0]) circle(r=1);
      }
      translate([5.65, 5.65, 0]) circle(d = screw_diameter());
      translate([36.65, 5.65, 0]) circle(d = screw_diameter());
      translate([5.65, 36.65, 0]) circle(d = screw_diameter());
      translate([36.65, 36.65, 0]) circle(d = screw_diameter());
    }
  }
}

module nema_17(texture_sides=true, shaft_length=25.6){
  translate([0, 0, 0]) nema17_end(top=false);
  translate([0, 0, 27]) nema17_end(top=true, shaft_length=shaft_length);
  if (texture_sides){
    for (h = [9:1:27]){
	   translate([0, 0, h]) nema17_slice(height = 1, wide=(h%2));
	 }
  } else {
    translate([0, 0, 9]) nema17_slice();
  }
}
