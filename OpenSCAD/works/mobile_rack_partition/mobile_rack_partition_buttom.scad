echo(version=version());

// 4 * 2 = 8
// 4 * 10 = 40
// 5 set

terminal=false;

defH=10;
defW=10;
defD=2;
defM=20;
defBD=2;

difference(){
    union(){

        cube([defW, defD, defH]);
        translate([0, defD + defBD, 0]) cube([defW, defD, defH]);

        translate([0, defM + defD, 0]) {
        cube([defW, defD, defH]);
        translate([0, defD + defBD, 0]) cube([defW, defD, defH]);
        }

        translate([0, 0, -defD]) cube([defW, defM + (defD + defBD) * 2, defD]);
    }
    if (terminal)
    {
        translate([0, 0, -defD]) cube([defW, defD+defBD, defH+defD]);
    }
}