echo(version=version());
include <screw.scad>

// thread(d,loopn,pitch,th,tw,minw,sw);
// d:ネジの直径。
// 雌ねじの場合は外側の直径、雄ねじの場合は内側の直径
// loopn:ネジ山数
// pitch:ネジピッチ
// th:ネジ山高さ
// tw:ネジ山幅
// minw:構成要素の最小幅
// これが小さいと変換に時間が掛かる。
// sw:
// 「０」または省略だと雌ねじ、「１」だと雄ねじ
// ネジの向きを変える場合は「mirror」を使って反転させる。「rotate」では反転しない

*thread(24,35,1.8,2,0,1,0);
*thread(24,35,1.8,2,0,1,1);

// Base Config
base_W = 60;
base_H = 80;
base_T = 0.5;
default_T = 2.0;
default_S = 12;
$fn = 60;


*staple_base(base_T,base_W,base_H,default_S,default_T);

helicoid(20,60,2,30,2);

// hRadius : radius of the stock cylinder
// hLength : length of the stock cylinder
// hTwist  : amount of twist (in degrees)
// hN      : number of sectors
// hGap    : size of clearance gap for sliding surfaces
module helicoid(hRadius,hLength,hTwist,hN,hGap)
{
 hSlices=10*hLength;
 linear_extrude(height=hLength,twist = hTwist,center=true,slices=hSlices)
 projection(cut=true)
 {
  for(i=[1:hN])
  {
   rotate(a=[0,0,(360*i)/hN])
    translate([-hGap,-hGap/2,-1])
     cube([hRadius+hGap,hGap,2]);
  }
 }
}


* difference() {
    translate([30, 35, 0]) cylinder(h = 25, r = 15);
    translate([30, 35, 10]) cylinder(h = 22, r = 13);
    translate([30, 35, 10]) thread(24,35,1.8,2,0,1,1);
}

* cylinder(h = 42, r = 10);
* thread(24,24,1.8,2,0,1,0);

*difference() {
    translate([30, 30, 0]) cylinder(h = 60, r = 17);
    translate([30, 30, 0]) cylinder(h = 60, r = 15.2);
}
*translate([30, 30, 60]) cylinder(h = 10, r = 25);

module stapler_area(bt,bw,ds,dt) {
    hull() {
        translate([0, 0, dt - bt]) cube([bw - dt, ds + 2, 0.1]);
        translate([1, 1, 0]) cube([bw - dt * 2, ds, 0.1]);
    }
}

module staple_base(bt,bw,bh,ds,dt) {
    union() {
        // Base1(Bottom)
        cube([bw, bh, bt]);
        // Base2(Top)
        translate([0, 0, bt]) {
            difference() {
                // Base2_body
                hull() {
                    translate([1, 1, dt - bt]) cube([bw - 2, bh - 2, 0.1]);
                    translate([0, 0, 0]) cube([bw, bh, 0.1]);
                }
                // Base2_stapler_area1(Top)
                # translate([dt - 1, dt - 1, 0]) stapler_area(bt,bw,ds,dt);
                // Base2_stapler_area2(Bottom)
                # translate([dt - 1, bh - ds - dt - 1, 0]) stapler_area(bt,bw,ds,dt);
            }
        }
    }
}

