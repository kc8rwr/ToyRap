$fn=360;
module screw_stamp() {
  union(){
    translate([0, 0, 1]) cylinder(d=6.5, h=2);
    translate([-0.5, -2.5, 0]) cube([1, 5, 1.5]);
    translate([-2.5, -0.5, 0]) cube([5, 1, 1.5]);
  }
}

module power(){
  difference(){
    union(){
      linear_extrude(height=2){
        hull(){
          translate([10, 0, 0]) square([30, 22]);
          translate([2.5, 11, 0]) circle(d=5);
          translate([47.5, 11, 0]) circle(d=5);
        }
      }
      linear_extrude(height=4){
        hull(){
          translate([12, 1, 0]) circle(d=2);
          translate([12, 21, 0]) circle(d=2);
          translate([39, 1, 0]) circle(d=2);
          translate([39, 21, 0]) circle(d=2);
        }
      }
    }
    translate([13, 2.5, 3]){
      linear_extrude(height=2){
        polygon(points=[[0,0],[0, 10], [6, 17], [20, 17], [25, 10], [25, 0]]);
      }
    }
    translate([6, 11, 0.5]) screw_stamp();
    translate([44.5, 11, 0.5]) screw_stamp();
  }
}

module switch(){
  linear_extrude(height=1){
    hull(){
      translate([0.5, 0.5, 0]) circle(d=1);
      translate([0.5, 12.5, 0]) circle(d=1);
      translate([17.65, 0.5, 0]) circle(d=1);
      translate([17.65, 12.5, 0]) circle(d=1);
    }
  }
  translate([1.375, 11.625, 0.5]){
    rotate([90, 0, 0]){
      linear_extrude(height=10.25){
        polygon(points=[[0, 0], [0, 1], [6.33, 1], [11.33, 4.7], [15.4, 1], [15.4, 0]]);
      }
    }
  }
}

module supply(){
  difference() {
    cube([150, 140, 86]);
    translate ([53, 2, 43]) rotate([90, 0, 0]) cylinder(d=76, h=3); //fan hole
    translate ([15, 1.5, 78.5]) rotate([90, 0, 0]) screw_stamp();
    translate ([15, 1.5, 7.5]) rotate([90, 0, 0]) screw_stamp();
    translate ([91, 1.5, 7.5]) rotate([90, 0, 0]) screw_stamp();
    translate ([91, 1.5, 78.5]) rotate([90, 0, 0]) screw_stamp();
  }
  translate([98, 0.5, 45]) rotate([90, 0, 0]) power();
  translate([115, 0.5, 20]) rotate([90, 0, 0]) switch();
}  

supply();
