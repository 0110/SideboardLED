// Define all parameter
tupeDiameter=20;
materialWidth=3;
drill=5;
percentOpen=30;


// Clip
outsideDiameter=(tupeDiameter+materialWidth*2);
difference() {
cylinder(d=outsideDiameter, h=materialWidth, center=true, $fn=180);
    union() {
        cylinder(d=(tupeDiameter), h=materialWidth, center=true, $fn=180);
        translate([outsideDiameter*(100-percentOpen)/100,0,0]) cube([outsideDiameter,outsideDiameter,materialWidth*2], center=true);
    }
}
// Mount to the Sideboard

translate([-outsideDiameter/2,0,drill]) difference() {
cube([materialWidth,drill*2+materialWidth,drill*2+materialWidth], center=true);
    rotate([0,90,0]) cylinder(d=(drill), h=materialWidth*2, center=true, $fn=180);
}