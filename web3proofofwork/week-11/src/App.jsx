import {QueryClient, QueryClientProvider, useQuery} from "@tanstack/react-query"
import { useState } from "react";

import { createPublicClient, http } from "viem";

import {   sepolia } from "viem/chains";





const client = createPublicClient({
  chain: sepolia,
  transport: http(),
});

async function getbalance() {
  const res = await client.getBalance({
    address: "0xa3fb5faC25Ede1C1587f0Ee0a2af04fB6b3D5B5b",
  });
  console.log(res)
 return res;
}



const App = () => {
  const queryclient = new QueryClient();
  return (
    <QueryClientProvider client={queryclient}>
      <Balance></Balance>
    </QueryClientProvider>

  )
};

const Balance = ()=>{
  const[block , setblock] = useState("")
  const query = useQuery({queryKey:['balance'] , queryFn:getbalance})
  const getblocknumber = async()=>{
    const blockNumber = await client.getBlockNumber() ;
    console.log(blockNumber)
    setblock(blockNumber);
   }
  
  return (
    <>
        <div>
      Balance {query.data}
    </div>
    <br />
    {/* <p>{block &&  <div> no block yet</div>}</p> */}
    <button onClick={getblocknumber}>
      show block number
    </button>
    </>

  )
}

export default App;
