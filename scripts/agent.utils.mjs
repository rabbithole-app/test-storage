import pkgAgent from '@dfinity/agent';
import fetch from 'node-fetch';
import { initIdentity } from './utils/identity.utils.mjs';

const { HttpAgent } = pkgAgent;

export async function getLocalHttpAgent() {
    const identity = initIdentity();
    const agent = new HttpAgent({ identity, fetch, host: 'http://127.0.0.1:4943/' });
    await agent.fetchRootKey();

    return agent;
}