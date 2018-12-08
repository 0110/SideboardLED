boardWidth=39;
boardDeepth=43;
wallWidth=2;
wallHeight=30;
// connectors
buttonHole=7.5;
powerHole=8.5;
// USB mount
usbWidth=8;
usbHeight=4;

// box mount
drill=5;


cube([boardWidth,boardDeepth,wallWidth], center=true);
// right
translate([boardWidth/2+wallWidth/2,0,wallHeight/2-wallWidth/2]) difference() {
    cube([wallWidth,boardDeepth, wallHeight], center=true);
    // power
    translate([0, boardDeepth*0.33,wallHeight*0.25]) rotate([0,90,0]) cylinder(d=powerHole, h=wallWidth*2, center=true, $fn=180);
    // button
    translate([0, 0,wallHeight*0.25]) rotate([0,90,0]) cylinder(d=buttonHole, h=wallWidth*2, center=true, $fn=180);
}
// left
translate([-(boardWidth/2+wallWidth/2),0,wallHeight/2-wallWidth/2]) cube([wallWidth,boardDeepth, wallHeight], center=true);
// top
translate([0,boardDeepth/2+wallWidth/2,wallHeight/2-wallWidth/2]) cube([boardWidth+2*wallWidth,wallWidth, wallHeight], center=true);
// buttom
translate([0,-(boardDeepth/2+wallWidth/2),wallHeight/2-wallWidth/2]) difference() {
    cube([boardWidth+2*wallWidth,wallWidth, wallHeight], center=true);
    translate([-boardWidth*0.20, 0,wallHeight*0.25]) cube([usbWidth, 2*wallWidth, usbHeight], center=true);
}

// Mount to the Sideboard
translate([0,boardDeepth/2+wallWidth+(drill*2+wallWidth)/2,0]) difference() {
cube([drill*2+wallWidth,drill*2+wallWidth,wallWidth], center=true);
    cylinder(d=(drill), h=wallWidth*2, center=true, $fn=180);
}
translate([0,-(boardDeepth/2+wallWidth+(drill*2+wallWidth)/2),0]) difference() {
cube([drill*2+wallWidth,drill*2+wallWidth,wallWidth], center=true);
    cylinder(d=(drill), h=wallWidth*2, center=true, $fn=180);
}