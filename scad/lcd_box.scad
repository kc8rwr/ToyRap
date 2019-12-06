use <common.scad>

$fn=360;

module lcd_box(name=" Hello", name_size=7, sub_name="      Name Me!", sub_name_size=4){
  difference(){
    union(){
      hull(){
        cube(1); //base front left 
        translate([35, 0, 0]) cube(1); //base front right
        translate([35, 36, 0]) cube(1);  //base back right
        translate([0, 36, 0]) cube(1); //base back left
        translate([0, 0, 5]) cube(1);//top front left
        translate([35, 0, 5]) cube(1);//top front right
        translate([35, 36, 13]) cube(1);//top back right
        translate([0, 36, 13]) cube(1);//top back left
      }
      rotate([12.5, 0, 0]) translate([0, 1, 5]){
        translate([1, 1, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
        translate([35, 1, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
        translate([35, 35, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
        translate([1, 35, 0]) scale([0.33, 0.33, 0.33]) hex_cap();
        linear_extrude(height=1.5){
          translate([-1, 11, 0]) text(text=name, size=name_size);
          translate([-1, 4, 0]) text(text=sub_name, size=sub_name_size);
        }
        translate([30, 13, 0]) cylinder(d=7, h=3);
        translate([30, 13, 0]) cylinder(d=4, h=7);
        translate([30, 13, 0]) cube([2, 2, 7]);
      }
    }
    rotate([12.5, 0, 0]) translate([0, -1, 5]){
      translate([2, 22, -0.5]) cube([32.4, 16, 2]);
    }
  }
}

lcd_box(name="", sub_name_size=6, sub_name="  ToyRap");