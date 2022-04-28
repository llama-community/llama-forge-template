# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update   :; forge update
install  :; forge install

# Build & test
build    :; forge clean && forge build --optimize --optimize-runs 1000000
test     :; forge clean && forge test -f ${RPC_URL} --fork-block-number ${BLOCK_NUMBER}
trace    :; forge clean && forge test -f ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} -vvv
match    :; forge clean && forge test -f ${RPC_URL} --fork-block-number ${BLOCK_NUMBER} -vvvv -m ${MATCH}  # Usage: make match MATCH=<TEST_FUNCTION_NAME>
report   :; forge clean && forge test --gas-report | sed -e/╭/\{ -e:1 -en\;b1 -e\} -ed | cat > .gas-report
clean    :; forge clean
lint     :; npx prettier --write src/**/*.sol