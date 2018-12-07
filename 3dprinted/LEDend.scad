// Define all parameter
tupeDiameter=20;
tupeInsideDiameter=15.5;
materialWidth=3;
cableHole=2;
percentOpen=65;


// Cover

difference() {
union() {
translate([0,0,-materialWidth/2]) cylinder(d=tupeInsideDiameter, h=materialWidth, center=true, $fn=180);
    translate([0,0,materialWidth/2]) cylinder(d=tupeDiameter, h=materialWidth, center=true, $fn=180);
}
    union() {
        translate([0,tupeInsideDiameter*(100-percentOpen)/100,0]) cube([cableHole,tupeInsideDiameter,materialWidth*3], center=true);
    }
}
