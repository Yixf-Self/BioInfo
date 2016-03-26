use v6;
use Test;
plan 2;

use BioInfo;

{
    my $dnastr = " 
>AT4G03560.1 atTPC1 Channel
ATGGAAGACCCGTTGATTGGTAGAGATAGTCTTGGTGGTGGTGGTACGGATCGGGTTCGTCGATCAGAAGCTATCACGCATGGTACTCCGTTTCAGAAAGCAGCTGCACTCGTTGATCTGGCTGAAGATGGTATTGGTCTTCCTGTGGAAATACTTGATCAGTCGAGTTTCGGGGAGTCTGCTAGGTATTACTTCATCTTCACACGTTTGGATCTGATCTGGTCACTCAACTATTTCGCTCTGCTTTTCCTTAACTTCTTCGAGCAACCATTGTGGTGTGAAAAAAACCCTAAACCGTCTTGCAAAGATAGAGATTACTATTACCTGGGAGAGTTACCGTACTTGACCAATGCAGAATCCATTATCTATGAGGTGATTACCCTGGCTATACTCCTTGTACATACTTTCTTCCCGATATCCTATGAAGGTTCCCGAATCTTTTGGACTAGTCGCCTGAATCTAGTGAAGGTTGCTTGCGTGGTAATTTTGTTTGTTGATGTGCTGGTTGACTTTCTGTATCTGTCTCCACTGGCTTTCGACTTTCTCCCTTTTAGAATCGCCCCATACGTGAGAGTTATCATATTCATCCTCAGCATAAGGGAACTTCGGGACACCCTTGTCCTTCTGTCTGGAATGCTTGGCACATACTTGAATATCTTGGCTCTATGGATGCTGTTCCTTCTATTTGCCAGTTGGATTGCTTTTGTTATGTTTGAGGACACGCAGCAGGGCCTCACGGTCTTCACTTCATATGGTGCAACTCTTTACCAGATGTTTATTTTGTTCACAACATCCAACAATCCTGATGTCTGGATTCCTGCATACAAGTCTTCTCGCTGGTCTTCGGTGTTCTTCGTGCTCTACGTGCTAATTGGCGTCTACTTTGTCACAAACTTGATTCTTGCCGTTGTTTATGACAGTTTCAAAGAACAGCTCGCAAAGCAAGTATCTGGAATGGATCAAATGAAGAGAAGAATGTTGGAGAAAGCCTTTGGTCTTATAGACTCAGACAAAAACGGGGAGATTGATAAGAACCAATGCATTAAGCTCTTTGAACAGTTGACTAATTACAGGACGTTGCCGAAGATATCAAAAGAAGAATTCGGATTGATATTTGATGAGCTTGACGATACTCGTGACTTTAAGATAAACAAGGATGAGTTTGCTGACCTCTGCCAGGCCATTGCTTTAAGATTCCAAAAGGAGGAAGTACCGTCTCTCTTTGAACATTTTCCGCAAATTTACCATTCCGCCTTATCACAACAACTGAGAGCCTTTGTTCGAAGCCCCAACTTTGGCTACGCTATTTCTTTCATCCTCATTATCAATTTCATTGCTGTCGTTGTTGAAACAACGCTTGATATCGAAGAAAGCTCGGCTCAGAAGCCATGGCAGGTTGCCGAGTTTGTCTTTGGTTGGATATATGTGTTGGAGATGGCTCTGAAGATCTATACATATGGATTTGAGAATTATTGGAGAGAGGGTGCTAACCGATTTGATTTTCTAGTCACATGGGTCATAGTTATTGGGGAAACAGCTACCTTCATAACTCCAGACGAGAATACTTTCTTCTCAAATGGAGAATGGATCCGGTACCTTCTCCTGGCGAGAATGTTAAGACTGATAAGGCTTCTTATGAACGTCCAGCGATACCGAGCATTTATTGCGACGTTCATAACTCTTATTCCAAGTTTGATGCCATATTTAGGGACCATTTTCTGCGTGCTGTGTATCTACTGCTCTATTGGCGTACAGGTCTTTGGAGGGCTTGTGAATGCTGGGAACAAAAAGCTCTTTGAAACCGAATTGGCTGAGGATGACTACCTTTTGTTCAACTTCAATGACTACCCCAATGGAATGGTCACACTCTTCAATCTGCTAGTTATGGGTAACTGGCAAGTATGGATGGAGAGCTACAAAGATTTGACGGGCACGTGGTGGAGCATTACATATTTCGTCAGTTTCTATGTCATCACTATTTTACTTCTGTTGAATTTGGTTGTTGCCTTTGTCTTGGAGGCGTTCTTTACTGAGCTGGATCTTGAAGAAGAAGAAAAATGTCAAGGACAGGATTCTCAAGAAAAAAGAAACAGGCGTCGATCTGCAGGGTCGAAGTCTCGGAGTCAGAGAGTTGATACACTTCTTCATCACATGTTGGGTGATGAACTCAGCAAACCAGAGTGTTCCACTTCTGACACATAA
";
    my @dna = BioInfo::Parser::FASTA::Grammar.parse($dnastr, actions => BioInfo::Parser::FASTA::Actions).ast;
    
    isa-ok @dna[0], BioInfo::Seq::DNA, 'Can parse FASTA correctly.';
    
    @dna = `
>AT4G03560.1 atTPC1 Channel
ATGGAAGACCCGTTGATTGGTAGAGATAGTCTTGGTGGTGGTGGTACGGATCGGGTTCGTCGATCAGAAGCTATCACGCATGGTACTCCGTTTCAGAAAGCAGCTGCACTCGTTGATCTGGCTGAAGATGGTATTGGTCTTCCTGTGGAAATACTTGATCAGTCGAGTTTCGGGGAGTCTGCTAGGTATTACTTCATCTTCACACGTTTGGATCTGATCTGGTCACTCAACTATTTCGCTCTGCTTTTCCTTAACTTCTTCGAGCAACCATTGTGGTGTGAAAAAAACCCTAAACCGTCTTGCAAAGATAGAGATTACTATTACCTGGGAGAGTTACCGTACTTGACCAATGCAGAATCCATTATCTATGAGGTGATTACCCTGGCTATACTCCTTGTACATACTTTCTTCCCGATATCCTATGAAGGTTCCCGAATCTTTTGGACTAGTCGCCTGAATCTAGTGAAGGTTGCTTGCGTGGTAATTTTGTTTGTTGATGTGCTGGTTGACTTTCTGTATCTGTCTCCACTGGCTTTCGACTTTCTCCCTTTTAGAATCGCCCCATACGTGAGAGTTATCATATTCATCCTCAGCATAAGGGAACTTCGGGACACCCTTGTCCTTCTGTCTGGAATGCTTGGCACATACTTGAATATCTTGGCTCTATGGATGCTGTTCCTTCTATTTGCCAGTTGGATTGCTTTTGTTATGTTTGAGGACACGCAGCAGGGCCTCACGGTCTTCACTTCATATGGTGCAACTCTTTACCAGATGTTTATTTTGTTCACAACATCCAACAATCCTGATGTCTGGATTCCTGCATACAAGTCTTCTCGCTGGTCTTCGGTGTTCTTCGTGCTCTACGTGCTAATTGGCGTCTACTTTGTCACAAACTTGATTCTTGCCGTTGTTTATGACAGTTTCAAAGAACAGCTCGCAAAGCAAGTATCTGGAATGGATCAAATGAAGAGAAGAATGTTGGAGAAAGCCTTTGGTCTTATAGACTCAGACAAAAACGGGGAGATTGATAAGAACCAATGCATTAAGCTCTTTGAACAGTTGACTAATTACAGGACGTTGCCGAAGATATCAAAAGAAGAATTCGGATTGATATTTGATGAGCTTGACGATACTCGTGACTTTAAGATAAACAAGGATGAGTTTGCTGACCTCTGCCAGGCCATTGCTTTAAGATTCCAAAAGGAGGAAGTACCGTCTCTCTTTGAACATTTTCCGCAAATTTACCATTCCGCCTTATCACAACAACTGAGAGCCTTTGTTCGAAGCCCCAACTTTGGCTACGCTATTTCTTTCATCCTCATTATCAATTTCATTGCTGTCGTTGTTGAAACAACGCTTGATATCGAAGAAAGCTCGGCTCAGAAGCCATGGCAGGTTGCCGAGTTTGTCTTTGGTTGGATATATGTGTTGGAGATGGCTCTGAAGATCTATACATATGGATTTGAGAATTATTGGAGAGAGGGTGCTAACCGATTTGATTTTCTAGTCACATGGGTCATAGTTATTGGGGAAACAGCTACCTTCATAACTCCAGACGAGAATACTTTCTTCTCAAATGGAGAATGGATCCGGTACCTTCTCCTGGCGAGAATGTTAAGACTGATAAGGCTTCTTATGAACGTCCAGCGATACCGAGCATTTATTGCGACGTTCATAACTCTTATTCCAAGTTTGATGCCATATTTAGGGACCATTTTCTGCGTGCTGTGTATCTACTGCTCTATTGGCGTACAGGTCTTTGGAGGGCTTGTGAATGCTGGGAACAAAAAGCTCTTTGAAACCGAATTGGCTGAGGATGACTACCTTTTGTTCAACTTCAATGACTACCCCAATGGAATGGTCACACTCTTCAATCTGCTAGTTATGGGTAACTGGCAAGTATGGATGGAGAGCTACAAAGATTTGACGGGCACGTGGTGGAGCATTACATATTTCGTCAGTTTCTATGTCATCACTATTTTACTTCTGTTGAATTTGGTTGTTGCCTTTGTCTTGGAGGCGTTCTTTACTGAGCTGGATCTTGAAGAAGAAGAAAAATGTCAAGGACAGGATTCTCAAGAAAAAAGAAACAGGCGTCGATCTGCAGGGTCGAAGTCTCGGAGTCAGAGAGTTGATACACTTCTTCATCACATGTTGGGTGATGAACTCAGCAAACCAGAGTGTTCCACTTCTGACACATAA
`;
    isa-ok @dna[0], BioInfo::Seq::DNA, 'Created DNA Seq successfully from Slang.';
}

done-testing;