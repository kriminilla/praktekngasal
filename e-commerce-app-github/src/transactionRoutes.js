const express = require('express');
const router = express.Router();
const TransactionController = require('../controllers/transactionController');

// Create a new transaction
router.post('/', TransactionController.createTransaction);

// Get a transaction by ID
router.get('/:id', TransactionController.getTransactionById);

// Get transactions by customer ID
router.get('/customer/:customerId', TransactionController.getTransactionsByCustomerId);

// Update transaction status
router.put('/:id/status', TransactionController.updateTransactionStatus);

// Delete a transaction
router.delete('/:id', TransactionController.deleteTransaction);

// Get all transactions
router.get('/', TransactionController.getAllTransactions);

module.exports = router;
