echo(version=version());

difference(){
    translate([0, 0, 10]) cube([50, 4, 20]);
    translate([1, 0, 11]) {
        hull(){
            cube([48, 0.1, 18]);
            translate([1, 1, 1]) cube([46, 0.1, 16]);
        }
    }
    translate([0, 3, 10]) {
        hull(){
            translate([2, 0, 2]) cube([46, 0.1, 16]);
            translate([1, 1, 1]) cube([48, 0.1, 18]);
        }
    }
}

cube([5, 1, 10]);
translate([0, 3, 0]) {
    cube([5, 1, 10]);
    translate([45, 0, 0]) cube([5, 1, 10]);
}
translate([45, 0, 0]) cube([5, 1, 10]);
