// https://ja.wikibooks.org/wiki/OpenSCAD_User_Manual/%E6%9D%A1%E4%BB%B6%E3%81%A8%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97

// 例1 - 配列要素に基づく繰り返し:
// for (z = [-1, 1]) // z = -1, z = 1 の2つの繰り返し
// {
//     translate([0, 0, z])
//     cube(size = 1, center = false);
// }

// 例2a - 範囲の繰り返し:
// for ( i = [0 : 5] )
// {
//     rotate( i * 360 / 6, [1, 0, 0])
//     translate([0, 10, 0])
//     sphere(r = 3);
// }

// 例2b - 増分を指定した範囲の繰り返し:
// 注: 2番めの引数 (この場合 '0.2' ) が増分
// 注: 増分によっては、実際の終値は与えられた終値
// より小さい場合がある。
for ( i = [0 : 0.2 : 5] )
{
    rotate( i * 360 / 6, [1, 0, 0])
    translate([0, 10, 0])
    sphere(r = 1);
}




// 例1 - 範囲の繰り返し:
* intersection_for(n = [1 : 6])
{
    rotate([0, 0, n * 60])
    {
        translate([5,0,0])
        sphere(r=12);
    }
}

// 例2 - 回転:
* intersection_for(i = [ [  0,  0,   0],
 			[ 10, 20, 300],
 			[200, 40,  57],
 			[ 20, 88,  57] ])
{
    rotate(i)
    cube([100, 20, 20], center = true);
}

