// Define all parameter
tupeDiameter=20;
tupeInsideDiameter=15.5;
tupeInsideDiameter2=17;
materialWidth=3;
materialWidthInside=5;
cableHole=2;
percentOpen=65;


// Cover

difference() {
union() {
    translate([0,0,-materialWidth/2]) cylinder(d1=tupeInsideDiameter, d2=tupeInsideDiameter2, h=materialWidthInside, center=true, $fn=200);
        translate([0,0,materialWidth/2]) cylinder(d=tupeDiameter, h=materialWidth, center=true, $fn=180);
    }
    union() {
        translate([0,tupeInsideDiameter*(100-percentOpen)/100,0]) cube([cableHole,tupeInsideDiameter,materialWidth*3], center=true);
    }
}
