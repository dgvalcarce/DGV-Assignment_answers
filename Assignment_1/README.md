Usage: ruby process_database.rb gene_information.tsv seed_stock_data.tsv cross_data.tsv <new_stock_file.tsv> (You can change the name of the "new_stock_file.tsv", to the one you desire)

This script will simulate planting 7 grams of each seed type contained in the "seed_stock_data.tsv" file. It will update the remaining quantities and the last day planted in the "new_stock_file.tsv".
It also analyzes the crossdata information in the "cross_data.tsv" file, looking for chisquares that would present a p-value lower than 0.05 for unlinked recessive genes. 
For the gene pairs that meet these conditions, a message and a final report are produced informing of their linkage.
The "gene_information.tsv" is necessary to relate the ID of the gene with its name, and the "seed_stock_data.tsv" file to identify what gene is mutated in each seed strain.
