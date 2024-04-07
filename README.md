# MathXEval

MathXEval is an evaluator for mathematical expressions. It parses an input string and attempts to evaluate the string as a mathematical expression.

## How does it work?

Some principles of lexing and parsing were applied in this solution. Firstly, the string is broken into tokens through an iteration. At the moment that a token is identified, it is pushed to a syntax tree. Some rules are applied during the parsing and tokenization in order to guarantee that only valid characters and character combinations are evaluated. Should any of those validations fail, the program is then terminated with an error message.

## Tokens that are currently accepted

In the [Token.pp](src/Token.pp) unit, you will find an enum with all accepted tokens. They are:

- Multiplication (*)
- Division (/)
- Addition (+)
- Subtraction (-)
- Integers 
- Floating point numbers

The tokens are classified into two categories: operations and numbers. You can guess which ones fall into each category.

The algorithm used for the evaluation of the expression takes into consideration operator precedence.

## How the tokens are evaluated 

### Building the tree of tokens

Each time a token is identified, it is pushed to a syntax tree. The syntax tree encapsulates a binary tree of tokens. It validates each token that is pushed and then inserts it in the binary tree.

The binary tree is a standard binary tree. It has a value, in this case a token, a `Left` and a `Right` properties that are instances of a binary tree of tokens. The instance of the tree is called root.

Besides the binary tree, there is also a reference to the last operation token tree that was inserted in the tree. This reference is used both in validations and insertions in the tree.

Here's the logic behind the process of building the tree:

1. It validates if the first element is a number.
2. It inserts the token in the root of the tree. Each time an operation token is inserted into the tree, The reference to the last token tree points to that token.
3. It validates if each token number is followed by an operation and vice-versa. This prevents two numbers and two operators one after the other.
4. The first operation token replaces the root of the tree (which was previously a number) and the previous root of the tree becomes the Left of the new root.

From this point forward, a few assumptions are made to guarantee the order of precedence of the operations.

- All new number tokens will be placed in the Right of the previously inserted operation token tree.
- All new operations will replace a given token in the tree. If the new token has precedence over the root token then it replaces the Right of the root token and its left will now reference the token which was replaced. However, if the new token is either equal or lower in preference, then the root token is replaced by the new token and the left of the new token will now point to the previous root.

The tree is assembled this way to allow for parsing the tree from left to right in depth.

### Evaluating the tree of tokens

After the tree is built, the easiest part comes into play: evaluating.

A recursive algorithm will traverse the tree depth first and calculate the values of each node based on the token.
If it is a number token, it simply returns the numerical value of the token, either an integer or a float as previously stated.
If it is an operation token, then the recursive algorithm is called on the Left and then the Right of the node, so that the corresponding operation can be executed on those values.


### TODO

- Parenthesis tokens
- Unary minus
- Exponentiation
