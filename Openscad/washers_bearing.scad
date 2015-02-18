/* BandMate Project, rod_mount.scad
 * rod_mount.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

translate([-15,0,0]) washer(height=1, r1=1.6, r2=6);
translate([0,0,0]) washer(height=1, r1=1.6, r2=6);
translate([0,0,1]) washer(height=4, r1=1.6, r2=4);


module washer(height, r1, r2)
{
  difference()
  {
    cylinder(h=height, r=r2);
    cylinder(h=height, r=r1);
  }
}
