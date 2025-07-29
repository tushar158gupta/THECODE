const fs = require("fs");
const {
  Connection,
  Keypair,
  clusterApiUrl,
  PublicKey
} = require("@solana/web3.js");
const {
  createMint,
  getOrCreateAssociatedTokenAccount,
  mintTo
} = require("@solana/spl-token");

// Step 1: Generate a new wallet and save it to file
function generateWallet() {
  const keypair = Keypair.generate();
  fs.writeFileSync("id.json", JSON.stringify(Array.from(keypair.secretKey)));
  console.log("✅ Wallet created:");
  console.log("🔑 Public Key:", keypair.publicKey.toBase58());
  return keypair;
}

// Step 2: Load wallet from saved file
function loadWallet() {
  const secret = JSON.parse(fs.readFileSync("id.json", "utf8"));
  return Keypair.fromSecretKey(Uint8Array.from(secret));
}

(async () => {
  // ✅ Connect to devnet
  const connection = new Connection(clusterApiUrl("devnet"), "confirmed");

  // ✅ Use existing or create new wallet
  let payer = [53,250,230,173,108,139,125,161,35,74,244,201,41,24,68,206,145,149,54,179,170,217,191,62,67,242,39,1,213,87,28,7,247,195,29,197,165,66,151,113,92,19,156,221,11,152,130,78,12,82,14,113,95,85,255,137,47,203,62,181,37,149,58,126];
 

  // ⚠️ Airdrop disabled due to rate limits. Use https://faucet.solana.com instead
  /*
  const airdropSignature = await connection.requestAirdrop(
    payer.publicKey,
    2e9 // 2 SOL
  );
  await connection.confirmTransaction(airdropSignature);
  console.log("💰 Airdropped 2 SOL to:", payer.publicKey.toBase58());
  */

  // ✅ Create new SPL Token mint
  const mint = await createMint(
    connection,
    payer,              // Fee payer
    payer.publicKey,    // Mint authority
    null,               // Freeze authority (optional)
    9                   // Decimals
  );
  console.log("🪙 Token Mint Address:", mint.toBase58());

  // ✅ Create token account for wallet
  const tokenAccount = await getOrCreateAssociatedTokenAccount(
    connection,
    payer,
    mint,
    payer.publicKey
  );
  console.log("📦 Token Account:", tokenAccount.address.toBase58());

  // ✅ Mint tokens to your account
  const amount = 1000 * 10 ** 9; // 1000 tokens (with 9 decimals)
  await mintTo(
    connection,
    payer,
    mint,
    tokenAccount.address,
    payer,
    amount
  );
  console.log(`✅ Minted ${amount / 10 ** 9} tokens to ${tokenAccount.address.toBase58()}`);
})();
