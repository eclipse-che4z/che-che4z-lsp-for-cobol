package org.eclipse.lsp.cobol.common.mapping;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class MultilineReplaceStrategyTest {
    @Test
    void testExecuteWithMultilineRange() {
        MultilineReplaceStrategy strategy = new MultilineReplaceStrategy();
        ExtendedText extendedText = new ExtendedText("Line 1\nLine 2\nLine 3", "uri");
        Range range = new Range(new Position(1, 0), new Position(2, 6));
        String newText = "New Line 1\nNew Line 2";
        Location originalLocation = new Location("original", range);

        assertTrue(strategy.execute(extendedText, range, newText, originalLocation));
        assertEquals("Line 1\nNew Line 1\nNew Line 2", extendedText.toString());
    }

    @Test
    void testExecuteWithSingleLineRange() {
        MultilineReplaceStrategy strategy = new MultilineReplaceStrategy();
        ExtendedText extendedText = new ExtendedText("Line 1", "uri");
        Range range = new Range(new Position(0, 0), new Position(0, 6));
        String newText = "New Line 1";
        Location originalLocation = new Location("original", range);

        assertFalse(strategy.execute(extendedText, range, newText, originalLocation));
        assertEquals("Line 1", extendedText.toString());
    }

    @Test
    void testExecuteWithNoLine() {
        MultilineReplaceStrategy strategy = new MultilineReplaceStrategy();
        ExtendedText extendedText = new ExtendedText("Line 1\nLine 2", "uri");
        Range range = new Range(new Position(0, 0), new Position(1, 6));
        String newLines = "\n";
        Location instantLocation = new Location("instant", range);

        assertTrue(strategy.execute(extendedText, range, newLines, instantLocation));
        assertEquals("", extendedText.toString());
    }
}
