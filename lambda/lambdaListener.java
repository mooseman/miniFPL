// Generated from lambda.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link lambdaParser}.
 */
public interface lambdaListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link lambdaParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterStmt(lambdaParser.StmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link lambdaParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitStmt(lambdaParser.StmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link lambdaParser#lambda_stmt}.
	 * @param ctx the parse tree
	 */
	void enterLambda_stmt(lambdaParser.Lambda_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link lambdaParser#lambda_stmt}.
	 * @param ctx the parse tree
	 */
	void exitLambda_stmt(lambdaParser.Lambda_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link lambdaParser#arrow}.
	 * @param ctx the parse tree
	 */
	void enterArrow(lambdaParser.ArrowContext ctx);
	/**
	 * Exit a parse tree produced by {@link lambdaParser#arrow}.
	 * @param ctx the parse tree
	 */
	void exitArrow(lambdaParser.ArrowContext ctx);
	/**
	 * Enter a parse tree produced by {@link lambdaParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(lambdaParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link lambdaParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(lambdaParser.ExprContext ctx);
}