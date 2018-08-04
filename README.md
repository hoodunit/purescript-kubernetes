# purescript-kubernetes

PureScript client for the Kubernetes API.

Supports Kubernetes API versions up to `1.10.0`.

Supports:

* Basic API calls: reading/creating/deleting deployments/namespaces/pods/whatever
* Authentication via basic auth, X509 client certificates, or bearer tokens.
* Client-specified HTTPS server certificates

Missing:

* Loading local kubeconfig
* Watch calls
* Untested: exec, attach, port-forward calls
* Encodings other than JSON
* Support for browser environment (works only in Node.js)

## Installation

```
bower install --save purescript-kubernetes
```

## Usage

See the [integration test](test/Integration/Main.purs) for an example. This deploys and exposes a Hello World pod, pings it, and then tears it all down.

API documentation is [published on Pursuit](https://pursuit.purescript.org/packages/purescript-kubernetes).

## Development

Assuming [Nix](https://nixos.org/nix/) is installed:

```
nix-shell
npm install
npm run bower -- update --force-latest

# Generate type definitions
npm run build:generation
npm run generate

npm run test:unit
```

All the `nix-shell` step does here is install Node.js, so you should also be able to install the version of Node.js in `default.nix` separately and run with that.

The Kubernetes API types and endpoints are generated from the Kubernetes Swagger definitions in the [definitions](./definitions) directory.

## Testing

Unit tests:

```
npm run test:unit
```

Integration tests:

```
npm run test:integration:local
```