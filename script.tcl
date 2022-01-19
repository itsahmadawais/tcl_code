set fp [open "input.txt" r]

#Declaring Variables
set maxInteger null
set minInteger null
set minStringLength null
array set integerValues {}
set oddNum 0
set evenNum 0
set invalid 0
array set strings {}
set lineNo 1

while { [gets $fp data] >= 0 } {
    if {[string is integer -strict $data]} {
        #Check if Max Integer is Set
        if {[string compare $maxInteger null]} {
            set maxInteger $data
        } elseif {$maxInteger<$data} {
            set maxInteger $data
        }
        #Check if Min Integer is Set
        if {[string compare $minInteger null]} {
            set maxInteger $data
        } elseif {$minInteger>$data} {
            set minInteger $data
        }
    
        #If data is integer
        if { [expr $data % 2 ]==0 } {
            set tempVar [expr $data * 3.25]
            puts "Even $tempVar"
            incr evenNum
        } else {
            set tempVar [expr $data * 2]
            puts "Odd $tempVar"
            incr oddNum
        }
        
        #If IntegerValues are not set
        if {[array size integerValues]==0} {
            set integerValues(0) $data
        } else {
            if {[array size integerValues]==2} {
                puts "SUM OF First 2 Integers: [expr $integerValues(0)+$integerValues(1)]"
            } else {
                puts "Invalid Message"
                incr invalid
            }
            set integerValues([array size integerValues]) $data
        }
    } elseif {[string match -nocase {[a-z]*} $data] || [string is double -strict $data]} {
        puts $data
        if {[string compare $data null]} {
            set minStringLength [string length $data]
        } elseif {[string length $data]<$minStringLength} {
            set minStringLength [string length $data]
        }
        #If strings are not set
        if {[array size strings]==0} {
            set strings(0) $data
        } else {
            if {[array size strings]==3} {
                puts "Concatenation of first 3 strings: $strings(0) $strings(1) $strings(2)"
            } else {
                puts "Invalid Message"
                incr invalid
            }
            set strings([array size strings]) $data
        }
    }
    #print all lines with the length of each line.
    puts "Line $lineNo: $data (Length: [string length $data])"
    incr lineNo
}
close $fp

puts "Maximum Integer in the file: $maxInteger"
puts "Minimum String in the file: $minStringLength"

puts "############################"
puts "Report"
puts "############################"
puts "Strings (count): [array size strings]"
puts "Odd Number (count): $oddNum "
puts "Even Number (counr): $evenNum "
puts "Invalid (count): $invalid "