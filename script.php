<?php
/**
 * A TCL script that reads a file on the filesystem ( named input.txt ), the script should process each line using the below rules:
 *  lines start with string characters, print the line as is without any changes.
 *  lines that present an odd integer value, divide the value with 2, and print it.
 *  lines that present an even integer value, multiply the value with 3.25, and print it.
 *  print the summation of the first 2 integer values occurring in the file.
 *  print the concatenation of the first 3 lines starting with the string characters.
 *  print all lines with the length of each line.
 *  print a line with maximum integer value found in the file, and the minimum length of "non-empty string" in the whole file.
 *  after printing all lines, print a small report with a number of lines that are found to be containing string, odd number, even number, or invalid.
 */
$myfile = fopen("webdictionary.txt", "r") or die("Unable to open file!");
$strings = [];
$inetegrs = [];
$max_integer = null;
$min_integer = null;
$even_number = [];
$odd_number = [];


// Output one line until end-of-file
while(!feof($myfile)) {
    $temp_val = fgets($myfile);
    if(is_string($temp_val)){
        echo $temp_val;
        $strings[] = $temp_val;
    }
    else if(is_integer($temp_val)){
        if($max_integer==null){
            $max_integer = $temp_val;
        }
        else if($temp_val>$max_integer){
            $max_integer = $temp_val;
        }
        if($min_integer==null){
            $min_integer = $temp_val;
        }
        else if($min_integer<$temp_val){
            $min_integer = $temp_val;
        }
        if($temp_val%2!=0){
            echo $temp_val/2;
        }
        else{
            echo $temp_val*3.25;
        }
    }
}
fclose($myfile);

?>